using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp.Models
{
    internal class ResultModel
    {
        public int Line { get; set; }
        public string Name { get; set; }
        //public Dictionary<int, string[]> Body { get; set; }
        public string Body { get; set; }
        public string Query { get; set; }
        public string Condition { get; set; }

        public ResultModel()
        {

        }
    }
}
