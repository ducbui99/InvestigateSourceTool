using System;
using System.Collections.Generic;
using System.Text;

namespace VDT.CompareDbExcel
{
    public class ResultMapItem
    {
        public DBExportItem InDatabase { get; set; }
        public BDDesignItem InBasicDesign { get; set; }
        public string Different { get; set; }
    }
}
