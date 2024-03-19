using System.Runtime.InteropServices;

namespace Native.Aot.Cs.Shared;

public class SharedLibrary
{
    [UnmanagedCallersOnly(EntryPoint = "native_aot_shared_add")]
    public static int Add(int a, int b)
    {
        return a + b;
    }
}