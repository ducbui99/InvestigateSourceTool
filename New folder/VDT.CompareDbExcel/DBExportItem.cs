using System;
using System.Collections.Generic;
using System.Text;

namespace VDT.CompareDbExcel
{
    public class DBExportItem
    {
        public string TableName { get; set; }
        public string ColumnName { get; set; }
        public string DataType { get; set; }
        public string Default { get; set; }
        public string IsNull { get; set; }
    }
}
