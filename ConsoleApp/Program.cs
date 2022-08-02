using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Text;
using System.Text.RegularExpressions;

using ConsoleApp.Models;

using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;

using ExcelDataReader;

using Newtonsoft.Json;


//Console.InputEncoding = System.Text.Encoding.Unicode;
//Console.OutputEncoding = System.Text.Encoding.UTF8;
//Console.Write("Input path: ");
const string RootPath = @"D:\FPT\Genius\Projects\InvestigateSourceTool\New folder\investsource\マスタ登録_ソース";

Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);
DataTableCollection tableCollection;
var list = new List<ResultModel>();


var path = @"D:\FPT\Genius\Projects\InvestigateSourceTool\New folder\investsource\ソースコード調査結果.xlsx";//Console.ReadLine();
using (var stream = File.Open(path, FileMode.Open, FileAccess.Read))
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
            Console.WriteLine(table.TableName);
            foreach (DataRow row in table.Rows)
            {
                if (row[5] != DBNull.Value && (double)row[5] != 0)
                {
                    var checkedFilePath = (string)row[4];
                    ProcessCheckedFile(RootPath + @"\" + checkedFilePath);
                    //ProcessCheckedFile(RootPath + @"\" + @"HAP000010\Base\HAP000010BaseU.pas");
                    //return;
                }
            }
        }
        WriteExcelFile(list.OrderBy(x => x.Line).ToList());

    }
}
void ProcessCheckedFile(string path)
{
    var lines = File.ReadAllLines(path);
    int count = 0;
    for (int i = 0; i < lines.Length; i++)
    {
        if (lines[i].ToLower().Contains("sql.add"))
        {
            count++;
            ResultModel funcModel = GetResultModel(lines, i);
            if (funcModel != null)
                list.Add(funcModel);
            //Console.WriteLine($"Name: {funcModel.Name}\nBody: {funcModel.Body}");
        }
    }
    Console.WriteLine(count);

    //using (var stream = File.OpenText(path))
    //{
    //    string s;
    //    while ((s = stream.ReadLine()) != null)
    //    {
    //    }
    //}
}

ResultModel GetResultModel(string[] lines, int line)
{
    var regex1 = new Regex(@"(?<=procedure|function).+(?=\()");
    var regex2 = new Regex(@"(?<=procedure|function).+(?=:)");
    var regex3 = new Regex(@"(?<=procedure|function).+(?=;)");
    Regex regex;
    for (int i = line; i >= 0; i--)
    {
        if (lines[i].StartsWith("procedure") || lines[i].StartsWith("function"))
        {
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