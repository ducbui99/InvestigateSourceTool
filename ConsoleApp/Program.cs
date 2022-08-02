using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Text;
using System.Text.RegularExpressions;

using ConsoleApp;
using ConsoleApp.Models;

using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;

using ExcelDataReader;

using Newtonsoft.Json;


//Console.InputEncoding = System.Text.Encoding.Unicode;
//Console.OutputEncoding = System.Text.Encoding.UTF8;
//Console.Write("Input path: ");
Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);
const string RootPath = @"D:\FPT\Genius\Projects\InvestigateSourceTool\New folder\investsource\マスタ登録_ソース";
const string FilePath = @"D:\FPT\Genius\Projects\InvestigateSourceTool\New folder\investsource\ソースコード調査結果.xlsx";
var investigator = new Investigator(RootPath, FilePath);
investigator.Process();

//void WriteFile(string keyword, IList<string> paths)
//{
//    var folder = @"D:\FPT\Genius\Projects\InvestigateSourceTool\New folder\Keywords";
//    var fullPath = $@"{folder}\{keyword}.txt";
//    using (StreamWriter writer = new StreamWriter(fullPath))
//    {
//        foreach (var item in paths)
//        {
//            writer.WriteLineAsync(item);
//        }
//    }
//}