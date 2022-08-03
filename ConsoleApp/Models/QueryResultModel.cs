using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

using DocumentFormat.OpenXml.InkML;
using Newtonsoft.Json;

namespace ConsoleApp.Models
{
    internal class QueryResultModel
    {
        [JsonProperty(PropertyName = "No.")]
        public int Number { get; set; }
        public int Line { get; set; }
        [JsonProperty(PropertyName = "Function/Procedure")]
        public string Name { get; set; }
        public string Query { get; set; }
        public string Condition { get; set; }
        public string Mapping { get; set; }
        public string Refection { get; set; }
        public string Reason { get; set; }

        public QueryResultModel()
        {
        }

        public int GetLineIndex() => Line - 1;
    }
}
