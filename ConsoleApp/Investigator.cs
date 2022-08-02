using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

using ConsoleApp.Models;

using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Office2010.ExcelAc;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;

using ExcelDataReader;

using Newtonsoft.Json;

namespace ConsoleApp;

internal class Investigator
{
    public string RootPath { get; }
    public string FilePath { get; }

    public List<ResultModel> Results { get; set; } = new List<ResultModel>();

    public Investigator(string rootPath, string filePath)
    {
        RootPath = rootPath;
        FilePath = filePath;
    }

    public void Process()
    {
        DataTableCollection tableCollection;

        using (var stream = File.Open(FilePath, FileMode.Open, FileAccess.Read))
        {
            using (IExcelDataReader reader = ExcelReaderFactory.CreateReader(stream))
            {
                DataSet result = reader.AsDataSet(new ExcelDataSetConfiguration()
                {
                    ConfigureDataTable = (_) => new ExcelDataTableConfiguration()
                    {
                        UseHeaderRow = false,
                    }
                });

                tableCollection = result.Tables;
                foreach (DataTable table in tableCollection)
                {
                    var keyword = "sql.add";
                    foreach (DataRow row in table.Rows)
                    {
                        // if check column has value
                        if (row[5] != DBNull.Value && (double)row[5] != 0)
                        {
                            //var sourceFilePath = (string)row[4];
                            var sourceFilePath = @"JNTCRP020000\JNTCRP020101u.pas";
                            InvestigateSourceFile(sourceFilePath, keyword);
                            break;
                        }
                    }
                    WriteExcelFile(Results.OrderBy(x => x.Line).ToList());
                }

            }
        }
    }

    void InvestigateSourceFile(string path, string keyword)
    {
        var fullPath = RootPath + "\\" + path;
        var lines = File.ReadAllLines(fullPath);
        for (int i = 0; i < lines.Length; i++)
        {
            var currentLine = lines[i];
            var isCommentedInline = currentLine.Trim().StartsWith("//")
                || currentLine.Trim().StartsWith("{") && currentLine.Trim().EndsWith("}");

            if (currentLine.ToLower().Contains(keyword.ToLower()) && !isCommentedInline)
            {
                ResultModel funcModel = GetResultModel(lines, i);
                if (funcModel != null)
                    Results.Add(funcModel);
                else
                    Console.WriteLine($"cannot get result file {path} with keyword '{keyword}'");
                //Console.WriteLine($"Name: {funcModel.Name}\nBody: {funcModel.Body}");

            }
        }
        Console.WriteLine("Done");
    }

    ResultModel GetResultModel(string[] lines, int line)
    {
        Regex regex;
        Stack<string> brackets = new Stack<string>();
        for (int i = line; i >= 0; i--)
        {
            if (lines[i].Contains("{"))
            {
                if (brackets.Count > 0 && brackets.Peek() == "}")
                {
                    brackets.Pop();
                }
                else
                {
                    brackets.Push("{");
                }
            }
            if (lines[i].Contains("}"))
            {
                brackets.Push("}");
            }
            if (lines[i].StartsWith("procedure") || lines[i].StartsWith("function"))
            {
                if (brackets.Count > 0)
                {
                    Console.WriteLine($"commented at line {line + 1}");
                    return null;
                }
                if (lines[i].Contains("("))
                {
                    regex = new Regex(@"(?<=procedure|function).+(?=\()");
                }
                else if (lines[i].Contains(":"))
                {
                    regex = new Regex(@"(?<=procedure|function).+(?=:)");
                }
                else
                {
                    regex = new Regex(@"(?<=procedure|function).+(?=;)");
                }
                var name = regex.Match(lines[i]).ToString().Trim();

                //var body = GetBody(lines, i);
                var query = GetQuery(lines, line);

                return new ResultModel()
                {
                    Line = line,
                    Name = name,
                    Query = query,
                };
            }
        }
        return null;
    }

    string GetQuery(string[] lines, int headQuery)
    {
        StringBuilder b = new StringBuilder();
        for (int i = headQuery; i < lines.Length; i++)
        {
            b.AppendLine(lines[i]);
            if (lines[i].Contains(";"))
            {
                break;
            }
        }
        return b.ToString();
    }

    void WriteExcelFile(List<ResultModel> models)
    {
        // Lets converts our object data to Datatable for a simplified logic.
        // Datatable is most easy way to deal with complex datatypes for easy reading and formatting. 
        DataTable table = (DataTable)JsonConvert.DeserializeObject(JsonConvert.SerializeObject(models), (typeof(DataTable)));

        using (SpreadsheetDocument document = SpreadsheetDocument.Create("TestNewData.xlsx", SpreadsheetDocumentType.Workbook))
        {
            WorkbookPart workbookPart = document.AddWorkbookPart();
            workbookPart.Workbook = new Workbook();

            WorksheetPart worksheetPart = workbookPart.AddNewPart<WorksheetPart>();
            var sheetData = new SheetData();
            worksheetPart.Worksheet = new Worksheet(sheetData);

            Sheets sheets = workbookPart.Workbook.AppendChild(new Sheets());
            Sheet sheet = new Sheet() { Id = workbookPart.GetIdOfPart(worksheetPart), SheetId = 1, Name = "Sheet1" };

            sheets.Append(sheet);

            Row headerRow = new Row();

            List<String> columns = new List<string>();
            foreach (System.Data.DataColumn column in table.Columns)
            {
                columns.Add(column.ColumnName);

                Cell cell = new Cell();
                cell.DataType = CellValues.String;
                cell.CellValue = new CellValue(column.ColumnName);
                headerRow.AppendChild(cell);
            }

            sheetData.AppendChild(headerRow);

            foreach (DataRow dsrow in table.Rows)
            {
                Row newRow = new Row();
                foreach (String col in columns)
                {
                    Cell cell = new Cell();
                    cell.DataType = CellValues.String;
                    cell.CellValue = new CellValue(dsrow[col].ToString());
                    newRow.AppendChild(cell);
                }

                sheetData.AppendChild(newRow);
            }

            workbookPart.Workbook.Save();
        }
    }

    string GetBody(string[] lines, int headLine)
    {
        Stack<string> stack = new Stack<string>();
        bool started = false;
        StringBuilder b = new StringBuilder();
        for (int i = headLine; i < lines.Length; i++)
        {
            if (lines[i].Contains("{") && lines[i].Contains("}"))
                continue;
            else if (lines[i].Contains("{"))
            {
                stack.Push(lines[i]);
            }
            else if (lines[i].Contains("}"))
            {
                stack.Pop();
                if (stack.Count == 0)
                {
                    continue;
                }
            }
            if (stack.Count > 0)
            {
                continue;
            }
            b.AppendLine(lines[i]);

            //var line = lines[i].ToLower().Trim();
            //if (line == "begin" || line.StartsWith("case ") || line == "try")
            //{
            //    stack.Push(line);
            //}
            //else if (line == "end" || line == "end;")
            //{
            //    stack.Pop();
            //}

            //if (stack.Count > 0)
            //{
            //    started = true;
            //}

            //if (started && stack.Count == 0)
            //{
            //    break;
            //}
            if (lines[i].ToLower().StartsWith("end"))
                break;
        }
        return b.ToString();
    }
}
