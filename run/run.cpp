#include <iostream>
#include <string>

extern "C" {
	//void __cdecl write_string(char* val, int size)
	//{
	//	std::string s(val, size);
	//	std::cout << s;
	//}

	bool __cdecl read_bool()
	{
		bool rc;
		std::cin >> rc;
		return rc;
	}
	int __cdecl read_int()
	{
		int rc;
		std::cin >> rc;
		return rc;
	}
	double __cdecl read_float()
	{
		double rc;
		std::cin >> rc;
		return rc;
	}

}

extern "C" int __cdecl asm_main(void);

int main()
{
	asm_main();
    return 0;
}

