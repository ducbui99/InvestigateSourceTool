using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

using ConsoleApp.Models;

namespace ConsoleApp;

internal class SourceFileInvestigator
{
    public string RootPath { get; }
    public string Path { get; }
    public string FullPath { get => RootPath + "\\" + Path; }
    public string FileName
    { 
        get
        {
            var index = Path.LastIndexOf("\\") + 1;
            var name = Path.Substring(index, Path.Length - index);
            return name;
        }
    }
    public string[] Lines { get; }
    public List<QueryResultModel> Results { get; set; } = new List<QueryResultModel>();

    public SourceFileInvestigator(string rootPath, string path)
    {
        RootPath = rootPath;
        Path = path;
        Lines = File.ReadAllLines(FullPath);
        Process();
    }

    void Process()
    {
        var keyword = "sql.add";
        var lines = File.ReadAllLines(FullPath);
        for (int i = 0; i < lines.Length; i++)
        {
            var currentLine = lines[i];
            var isCommentedInline = currentLine.Trim().StartsWith("//")
                || currentLine.Trim().StartsWith("{") && currentLine.Trim().EndsWith("}");

            if (currentLine.ToLower().Contains(keyword) && !isCommentedInline)
            {
                QueryResultModel funcModel = GetResultModel(i);
                if (funcModel != null)
                    Results.Add(funcModel);
                //else
                //    Console.WriteLine($"cannot get result file {Path} with keyword '{keyword}'");
                //Console.WriteLine($"Name: {funcModel.Name}\nBody: {funcModel.Body}");

            }
        }
        Results = Results.OrderBy(x => x.Line).Select((x, i) =>
        {
            x.Number = i + 1;
            return x;
        }).ToList();
        //Console.WriteLine("Done");
    }

    QueryResultModel GetResultModel(int line)
    {
        Regex regex;
        Stack<string> brackets = new Stack<string>();
        for (int i = line; i >= 0; i--)
        {
            if (Lines[i].Contains("{"))
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
            if (Lines[i].Contains("}"))
            {
                brackets.Push("}");
            }
            if (Lines[i].StartsWith("procedure") || Lines[i].StartsWith("function"))
            {
                if (brackets.Count > 0)
                {
                    //Console.WriteLine($"commented at line {line + 1}");
                    return null;
                }
                if (Lines[i].Contains("("))
                {
                    regex = new Regex(@"(?<=procedure|function).+(?=\()");
                }
                else if (Lines[i].Contains(":"))
                {
                    regex = new Regex(@"(?<=procedure|function).+(?=:)");
                }
                else
                {
                    regex = new Regex(@"(?<=procedure|function).+(?=;)");
                }
                var name = regex.Match(Lines[i]).ToString().Trim();

                //var body = GetBody(lines, i);
                var query = GetQuery(line);

                return new QueryResultModel()
                {
                    Line = line + 1,
                    Name = name,
                    Query = query,
                };
            }
        }
        return null;
    }

    string GetQuery(int headQuery)
    {
        StringBuilder b = new StringBuilder();
        for (int i = headQuery; i < Lines.Length; i++)
        {
            b.AppendLine(Lines[i]);
            if (Lines[i].Contains(";"))
            {
                break;
            }
        }
        return b.ToString();
    }
}
