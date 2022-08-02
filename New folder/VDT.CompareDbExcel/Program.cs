using System;
using IronXL;
using System.Linq;
using System.Collections.Generic;
using Newtonsoft.Json;

namespace VDT.CompareDbExcel
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("========== Compare Excel ==========");
            Console.WriteLine("===== Read DB Export =====");
            WorkBook workbookDB = WorkBook.Load("D:\\Documents\\Guideline Webinput Project\\Database Design\\expdata.xlsx");
            WorkSheet sheetDB = workbookDB.WorkSheets.First();
            var lstDBExport = new List<DBExportItem>();
            for (int r = 1; r < sheetDB.RowCount; r++)
            {
                var item = new DBExportItem()
                {
                    TableName = sheetDB.GetCellAt(r, 0).StringValue,
                    ColumnName = sheetDB.GetCellAt(r, 1).StringValue,
                    DataType = sheetDB.GetCellAt(r, 2).StringValue,
                    Default = sheetDB.GetCellAt(r, 3).StringValue,
                    IsNull = sheetDB.GetCellAt(r, 4).StringValue
                };
                lstDBExport.Add(item);
            }
            Console.WriteLine($"Line Count: {sheetDB.RowCount}");

            Console.WriteLine("===== Read DB Design =====");
            WorkBook workbookBD = WorkBook.Load("D:\\Documents\\Guideline Webinput Project\\Database Design\\bdpdata.xlsx");
            WorkSheet sheetBD = workbookBD.WorkSheets.First();
            var lstBDExport = new List<BDDesignItem>();
            for (int r = 1; r < sheetBD.RowCount; r++)
            {
                var item = new BDDesignItem()
                {
                    TableName = sheetBD.GetCellAt(r, 0).StringValue,
                    ColumnName = sheetBD.GetCellAt(r, 1).StringValue,
                    DataType = BuildBdDataType(r, sheetBD.GetCellAt(r, 2).StringValue, sheetBD.GetCellAt(r, 3).StringValue, sheetBD.GetCellAt(r, 4).StringValue),
                    IsNull = BuildIsNull(sheetBD.GetCellAt(r, 5).StringValue),
                    DataDefault = BuildDefault(r, sheetBD.GetCellAt(r, 6).StringValue, sheetBD.GetCellAt(r, 7).StringValue)
                };
                lstBDExport.Add(item);
            }
            Console.WriteLine($"Line Count: {sheetBD.RowCount}");

            Console.WriteLine("===== Process Compare =====");
            var result = ProcessCompare(lstDBExport, lstBDExport);
            Console.WriteLine("Result Compare:");
            Console.WriteLine(result);

            Console.WriteLine("@Copyright by ThangVD15");
        }

        /// <summary>
        /// Process Compare
        /// </summary>
        /// <param name="dbExports"></param>
        /// <param name="bdDesigns"></param>
        /// <returns></returns>
        private static string ProcessCompare(List<DBExportItem> dbExports, List<BDDesignItem> bdDesigns)
        {
            var resultCompare = new List<ResultMapItem>();
            foreach (var item in dbExports)
            {
                var findBDItem = bdDesigns.FirstOrDefault(p => string.Equals(p.TableName.Trim(), item.TableName.Trim(), StringComparison.OrdinalIgnoreCase)
                                                            && string.Equals(p.ColumnName.Trim(), item.ColumnName.Trim(), StringComparison.OrdinalIgnoreCase));
                if (findBDItem == null)
                {
                    resultCompare.Add(new ResultMapItem()
                    {
                        InDatabase = item,
                        InBasicDesign = findBDItem,
                        Different = "Not Design In Basic Design"
                    });
                    continue;
                }

                // Remove Compared BDDesign
                bdDesigns.Remove(findBDItem);

                // Compare DataType
                if (!string.Equals(item.DataType.Trim(), findBDItem.DataType.Trim(), StringComparison.OrdinalIgnoreCase))
                {
                    resultCompare.Add(new ResultMapItem()
                    {
                        InDatabase = item,
                        InBasicDesign = findBDItem,
                        Different = "Error DataType"
                    });
                    continue;
                }

                // Check IsNull
                if (!string.Equals(item.IsNull.Trim(), findBDItem.IsNull.Trim(), StringComparison.OrdinalIgnoreCase))
                {
                    resultCompare.Add(new ResultMapItem()
                    {
                        InDatabase = item,
                        InBasicDesign = findBDItem,
                        Different = "Error IsNull"
                    });
                    continue;
                }

                // Check DataDefault
                if (!string.Equals(item.Default.Trim(), findBDItem.DataDefault.Trim(), StringComparison.OrdinalIgnoreCase))
                {
                    resultCompare.Add(new ResultMapItem()
                    {
                        InDatabase = item,
                        InBasicDesign = findBDItem,
                        Different = "Error Default Value"
                    });
                    continue;
                }
            }

            if (bdDesigns != null && bdDesigns.Count > 0)
            {
                foreach (var item in bdDesigns)
                {
                    resultCompare.Add(new ResultMapItem()
                    {
                        InDatabase = null,
                        InBasicDesign = item,
                        Different = "Not Implement Indatabase"
                    });
                }
            }

            return JsonConvert.SerializeObject(resultCompare);
        }

        /// <summary>
        /// Build BD DataType
        /// </summary>
        /// <param name="dataTypeName"></param>
        /// <param name="preLength"></param>
        /// <param name="afterLength"></param>
        /// <returns></returns>
        private static string BuildBdDataType(int row, string dataTypeName, string preLength, string afterLength)
        {
            if (string.IsNullOrWhiteSpace(dataTypeName))
                throw new Exception($"Error DataType Column BD At: {row}");

            string dataType = string.Empty;
            switch (dataTypeName.ToUpper())
            {
                case "NUMERIC":
                    if (string.IsNullOrWhiteSpace(afterLength))
                        afterLength = "0";
                    if (string.IsNullOrWhiteSpace(preLength))
                        throw new Exception($"Error PreLength Column BD At: {row}");
                    dataType = $"NUMERIC({Convert.ToInt32(preLength.Trim())},{Convert.ToInt32(afterLength.Trim())})";
                    break;
                case "VARCHAR":
                case "NVARCHAR":
                case "CHAR":
                case "NCHAR":
                    if (string.IsNullOrWhiteSpace(preLength))
                        throw new Exception($"Error PreLength Column BD At: {row}");
                    dataType = $"{dataTypeName}({Convert.ToInt32(preLength.Trim())})";
                    break;
                default:
                    dataType = dataTypeName.ToUpper();
                    break;
            }

            return dataType;
        }

        /// <summary>
        /// Build BD IsNull
        /// </summary>
        /// <param name="isNull"></param>
        /// <returns></returns>
        private static string BuildIsNull(string isNull)
        {
            if (string.IsNullOrWhiteSpace(isNull))
                return "YES";
            else
                return "NO";
        }

        /// <summary>
        /// Build BD Default
        /// </summary>
        /// <param name="row"></param>
        /// <param name="isDefault"></param>
        /// <param name="dataDefault"></param>
        /// <returns></returns>
        private static string BuildDefault(int row, string isDefault, string dataDefault)
        {
            if (string.IsNullOrWhiteSpace(isDefault))
                return "null";
            else
            {
                if (string.IsNullOrWhiteSpace(dataDefault))
                    throw new Exception($"Error Default Data Column BD At: {row}");

                switch (dataDefault.ToUpper())
                {
                    case "TIMESTAMP":
                    case "NOW":
                        return "(getdate())";
                    default:
                        if (!string.IsNullOrWhiteSpace(dataDefault))
                            return $"(({dataDefault.Trim()}))";
                        else
                            return "null";
                }
            }
        }
    }
}
