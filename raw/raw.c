#include <windows.h>


//void __cdecl write_string(char* val, int size)
//{
//	std::string s(val, size);
//	std::cout << s;
//}
//
//BOOL __cdecl read_bool()
//{
//	BOOL rc;
//	std::cin >> rc;
//	return rc;
//}
//int __cdecl read_int()
//{
//	int rc;
//	std::cin >> rc;
//	return rc;
//}
//double __cdecl read_float()
//{
//	double rc;
//	std::cin >> rc;
//	return rc;
//}


int __cdecl asm_main(void);


unsigned int __stdcall raw_main()
{
	asm_main();
    return 0;
}

