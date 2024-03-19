using System.Runtime.InteropServices;

namespace native_aot_cs_console;

class Program
{
    [DllImport(dllName: "libnativecs", EntryPoint = "native_aot_shared_add")]
    public static extern int Add(int a, int b);
    
    static void Main(string[] args)
    {
        Console.WriteLine("1 + 1 = " + Add(1, 1));
    }
}