using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using ConsoleApp.Models;

namespace ConsoleApp
{
    internal class FileSourceInvestigator
    {
        public string Path { get; }
        public string[] Lines { get; }

        public FileSourceInvestigator(string path, string[] lines)
        {
            Path = path;
            Lines = lines;
        }

    }
}
