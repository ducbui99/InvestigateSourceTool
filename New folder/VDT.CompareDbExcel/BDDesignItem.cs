using System;
using System.Collections.Generic;
using System.Text;

namespace VDT.CompareDbExcel
{
    public class BDDesignItem
    {
        public string TableName { get; set; }
        public string ColumnName { get; set; }
        public string DataType { get; set; }
        public string PreLength { get; set; }
        public string AfterLength { get; set; }
        public string IsNull { get; set; }
        public string IsDefault { get; set; }
        public string DataDefault { get; set; }
    }
}
