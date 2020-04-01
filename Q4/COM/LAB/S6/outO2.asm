
progO2:     file format elf64-x86-64


Disassembly of section .init:

0000000000000878 <_init>:
 878:	48 83 ec 08          	sub    $0x8,%rsp
 87c:	48 8b 05 65 17 20 00 	mov    0x201765(%rip),%rax        # 201fe8 <__gmon_start__>
 883:	48 85 c0             	test   %rax,%rax
 886:	74 02                	je     88a <_init+0x12>
 888:	ff d0                	callq  *%rax
 88a:	48 83 c4 08          	add    $0x8,%rsp
 88e:	c3                   	retq   

Disassembly of section .plt:

0000000000000890 <.plt>:
 890:	ff 35 ea 16 20 00    	pushq  0x2016ea(%rip)        # 201f80 <_GLOBAL_OFFSET_TABLE_+0x8>
 896:	ff 25 ec 16 20 00    	jmpq   *0x2016ec(%rip)        # 201f88 <_GLOBAL_OFFSET_TABLE_+0x10>
 89c:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000008a0 <strlen@plt>:
 8a0:	ff 25 ea 16 20 00    	jmpq   *0x2016ea(%rip)        # 201f90 <strlen@GLIBC_2.2.5>
 8a6:	68 00 00 00 00       	pushq  $0x0
 8ab:	e9 e0 ff ff ff       	jmpq   890 <.plt>

00000000000008b0 <std::istream::operator>>(int&)@plt>:
 8b0:	ff 25 e2 16 20 00    	jmpq   *0x2016e2(%rip)        # 201f98 <std::istream::operator>>(int&)@GLIBCXX_3.4>
 8b6:	68 01 00 00 00       	pushq  $0x1
 8bb:	e9 d0 ff ff ff       	jmpq   890 <.plt>

00000000000008c0 <__cxa_atexit@plt>:
 8c0:	ff 25 da 16 20 00    	jmpq   *0x2016da(%rip)        # 201fa0 <__cxa_atexit@GLIBC_2.2.5>
 8c6:	68 02 00 00 00       	pushq  $0x2
 8cb:	e9 c0 ff ff ff       	jmpq   890 <.plt>

00000000000008d0 <__stack_chk_fail@plt>:
 8d0:	ff 25 d2 16 20 00    	jmpq   *0x2016d2(%rip)        # 201fa8 <__stack_chk_fail@GLIBC_2.4>
 8d6:	68 03 00 00 00       	pushq  $0x3
 8db:	e9 b0 ff ff ff       	jmpq   890 <.plt>

00000000000008e0 <std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@plt>:
 8e0:	ff 25 ca 16 20 00    	jmpq   *0x2016ca(%rip)        # 201fb0 <std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@GLIBCXX_3.4.9>
 8e6:	68 04 00 00 00       	pushq  $0x4
 8eb:	e9 a0 ff ff ff       	jmpq   890 <.plt>

00000000000008f0 <std::ios_base::Init::Init()@plt>:
 8f0:	ff 25 c2 16 20 00    	jmpq   *0x2016c2(%rip)        # 201fb8 <std::ios_base::Init::Init()@GLIBCXX_3.4>
 8f6:	68 05 00 00 00       	pushq  $0x5
 8fb:	e9 90 ff ff ff       	jmpq   890 <.plt>

0000000000000900 <std::basic_ios<char, std::char_traits<char> >::clear(std::_Ios_Iostate)@plt>:
 900:	ff 25 ba 16 20 00    	jmpq   *0x2016ba(%rip)        # 201fc0 <std::basic_ios<char, std::char_traits<char> >::clear(std::_Ios_Iostate)@GLIBCXX_3.4>
 906:	68 06 00 00 00       	pushq  $0x6
 90b:	e9 80 ff ff ff       	jmpq   890 <.plt>

0000000000000910 <std::ostream::operator<<(int)@plt>:
 910:	ff 25 b2 16 20 00    	jmpq   *0x2016b2(%rip)        # 201fc8 <std::ostream::operator<<(int)@GLIBCXX_3.4>
 916:	68 07 00 00 00       	pushq  $0x7
 91b:	e9 70 ff ff ff       	jmpq   890 <.plt>

Disassembly of section .plt.got:

0000000000000920 <__cxa_finalize@plt>:
 920:	ff 25 aa 16 20 00    	jmpq   *0x2016aa(%rip)        # 201fd0 <__cxa_finalize@GLIBC_2.2.5>
 926:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000000930 <main>:
 930:	48 8d 3d ad 03 00 00 	lea    0x3ad(%rip),%rdi        # ce4 <_IO_stdin_used+0x4>
 937:	48 83 ec 28          	sub    $0x28,%rsp
 93b:	31 f6                	xor    %esi,%esi
 93d:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
 944:	00 00 
 946:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
 94b:	31 c0                	xor    %eax,%eax
 94d:	e8 1e 02 00 00       	callq  b70 <outmsg(char const*, int*)>
 952:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
 957:	e8 f4 02 00 00       	callq  c50 <input(int*)>
 95c:	48 8d 3d 98 03 00 00 	lea    0x398(%rip),%rdi        # cfb <_IO_stdin_used+0x1b>
 963:	31 f6                	xor    %esi,%esi
 965:	e8 06 02 00 00       	callq  b70 <outmsg(char const*, int*)>
 96a:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
 96f:	e8 dc 02 00 00       	callq  c50 <input(int*)>
 974:	48 8d 3d 98 03 00 00 	lea    0x398(%rip),%rdi        # d13 <_IO_stdin_used+0x33>
 97b:	31 f6                	xor    %esi,%esi
 97d:	e8 ee 01 00 00       	callq  b70 <outmsg(char const*, int*)>
 982:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
 987:	e8 c4 02 00 00       	callq  c50 <input(int*)>
 98c:	8b 54 24 10          	mov    0x10(%rsp),%edx
 990:	8b 74 24 0c          	mov    0xc(%rsp),%esi
 994:	8b 7c 24 08          	mov    0x8(%rsp),%edi
 998:	e8 73 01 00 00       	callq  b10 <mathloop(int, int, int)>
 99d:	48 8d 74 24 14       	lea    0x14(%rsp),%rsi
 9a2:	48 8d 3d 81 03 00 00 	lea    0x381(%rip),%rdi        # d2a <_IO_stdin_used+0x4a>
 9a9:	89 44 24 14          	mov    %eax,0x14(%rsp)
 9ad:	e8 be 01 00 00       	callq  b70 <outmsg(char const*, int*)>
 9b2:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
 9b7:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
 9be:	00 00 
 9c0:	75 07                	jne    9c9 <main+0x99>
 9c2:	31 c0                	xor    %eax,%eax
 9c4:	48 83 c4 28          	add    $0x28,%rsp
 9c8:	c3                   	retq   
 9c9:	e8 02 ff ff ff       	callq  8d0 <__stack_chk_fail@plt>
 9ce:	66 90                	xchg   %ax,%ax

00000000000009d0 <_GLOBAL__sub_I__Z6outmsgPKcPi>:
 9d0:	48 8d 3d 82 18 20 00 	lea    0x201882(%rip),%rdi        # 202259 <std::__ioinit>
 9d7:	48 83 ec 08          	sub    $0x8,%rsp
 9db:	e8 10 ff ff ff       	callq  8f0 <std::ios_base::Init::Init()@plt>
 9e0:	48 8b 3d 11 16 20 00 	mov    0x201611(%rip),%rdi        # 201ff8 <std::ios_base::Init::~Init()@GLIBCXX_3.4>
 9e7:	48 8d 15 1a 16 20 00 	lea    0x20161a(%rip),%rdx        # 202008 <__dso_handle>
 9ee:	48 8d 35 64 18 20 00 	lea    0x201864(%rip),%rsi        # 202259 <std::__ioinit>
 9f5:	48 83 c4 08          	add    $0x8,%rsp
 9f9:	e9 c2 fe ff ff       	jmpq   8c0 <__cxa_atexit@plt>
 9fe:	66 90                	xchg   %ax,%ax

0000000000000a00 <_start>:
 a00:	31 ed                	xor    %ebp,%ebp
 a02:	49 89 d1             	mov    %rdx,%r9
 a05:	5e                   	pop    %rsi
 a06:	48 89 e2             	mov    %rsp,%rdx
 a09:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
 a0d:	50                   	push   %rax
 a0e:	54                   	push   %rsp
 a0f:	4c 8d 05 ba 02 00 00 	lea    0x2ba(%rip),%r8        # cd0 <__libc_csu_fini>
 a16:	48 8d 0d 43 02 00 00 	lea    0x243(%rip),%rcx        # c60 <__libc_csu_init>
 a1d:	48 8d 3d 0c ff ff ff 	lea    -0xf4(%rip),%rdi        # 930 <main>
 a24:	ff 15 b6 15 20 00    	callq  *0x2015b6(%rip)        # 201fe0 <__libc_start_main@GLIBC_2.2.5>
 a2a:	f4                   	hlt    
 a2b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000a30 <deregister_tm_clones>:
 a30:	48 8d 3d d9 15 20 00 	lea    0x2015d9(%rip),%rdi        # 202010 <__TMC_END__>
 a37:	55                   	push   %rbp
 a38:	48 8d 05 d1 15 20 00 	lea    0x2015d1(%rip),%rax        # 202010 <__TMC_END__>
 a3f:	48 39 f8             	cmp    %rdi,%rax
 a42:	48 89 e5             	mov    %rsp,%rbp
 a45:	74 19                	je     a60 <deregister_tm_clones+0x30>
 a47:	48 8b 05 8a 15 20 00 	mov    0x20158a(%rip),%rax        # 201fd8 <_ITM_deregisterTMCloneTable>
 a4e:	48 85 c0             	test   %rax,%rax
 a51:	74 0d                	je     a60 <deregister_tm_clones+0x30>
 a53:	5d                   	pop    %rbp
 a54:	ff e0                	jmpq   *%rax
 a56:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 a5d:	00 00 00 
 a60:	5d                   	pop    %rbp
 a61:	c3                   	retq   
 a62:	0f 1f 40 00          	nopl   0x0(%rax)
 a66:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 a6d:	00 00 00 

0000000000000a70 <register_tm_clones>:
 a70:	48 8d 3d 99 15 20 00 	lea    0x201599(%rip),%rdi        # 202010 <__TMC_END__>
 a77:	48 8d 35 92 15 20 00 	lea    0x201592(%rip),%rsi        # 202010 <__TMC_END__>
 a7e:	55                   	push   %rbp
 a7f:	48 29 fe             	sub    %rdi,%rsi
 a82:	48 89 e5             	mov    %rsp,%rbp
 a85:	48 c1 fe 03          	sar    $0x3,%rsi
 a89:	48 89 f0             	mov    %rsi,%rax
 a8c:	48 c1 e8 3f          	shr    $0x3f,%rax
 a90:	48 01 c6             	add    %rax,%rsi
 a93:	48 d1 fe             	sar    %rsi
 a96:	74 18                	je     ab0 <register_tm_clones+0x40>
 a98:	48 8b 05 51 15 20 00 	mov    0x201551(%rip),%rax        # 201ff0 <_ITM_registerTMCloneTable>
 a9f:	48 85 c0             	test   %rax,%rax
 aa2:	74 0c                	je     ab0 <register_tm_clones+0x40>
 aa4:	5d                   	pop    %rbp
 aa5:	ff e0                	jmpq   *%rax
 aa7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
 aae:	00 00 
 ab0:	5d                   	pop    %rbp
 ab1:	c3                   	retq   
 ab2:	0f 1f 40 00          	nopl   0x0(%rax)
 ab6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 abd:	00 00 00 

0000000000000ac0 <__do_global_dtors_aux>:
 ac0:	80 3d 91 17 20 00 00 	cmpb   $0x0,0x201791(%rip)        # 202258 <completed.7697>
 ac7:	75 2f                	jne    af8 <__do_global_dtors_aux+0x38>
 ac9:	48 83 3d ff 14 20 00 	cmpq   $0x0,0x2014ff(%rip)        # 201fd0 <__cxa_finalize@GLIBC_2.2.5>
 ad0:	00 
 ad1:	55                   	push   %rbp
 ad2:	48 89 e5             	mov    %rsp,%rbp
 ad5:	74 0c                	je     ae3 <__do_global_dtors_aux+0x23>
 ad7:	48 8b 3d 2a 15 20 00 	mov    0x20152a(%rip),%rdi        # 202008 <__dso_handle>
 ade:	e8 3d fe ff ff       	callq  920 <__cxa_finalize@plt>
 ae3:	e8 48 ff ff ff       	callq  a30 <deregister_tm_clones>
 ae8:	c6 05 69 17 20 00 01 	movb   $0x1,0x201769(%rip)        # 202258 <completed.7697>
 aef:	5d                   	pop    %rbp
 af0:	c3                   	retq   
 af1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
 af8:	f3 c3                	repz retq 
 afa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000b00 <frame_dummy>:
 b00:	55                   	push   %rbp
 b01:	48 89 e5             	mov    %rsp,%rbp
 b04:	5d                   	pop    %rbp
 b05:	e9 66 ff ff ff       	jmpq   a70 <register_tm_clones>
 b0a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000b10 <mathloop(int, int, int)>:
 b10:	31 c0                	xor    %eax,%eax
 b12:	85 ff                	test   %edi,%edi
 b14:	7e 4b                	jle    b61 <mathloop(int, int, int)+0x51>
 b16:	45 31 db             	xor    %r11d,%r11d
 b19:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
 b20:	85 f6                	test   %esi,%esi
 b22:	7e 32                	jle    b56 <mathloop(int, int, int)+0x46>
 b24:	45 31 c9             	xor    %r9d,%r9d
 b27:	45 31 d2             	xor    %r10d,%r10d
 b2a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
 b30:	85 d2                	test   %edx,%edx
 b32:	7e 16                	jle    b4a <mathloop(int, int, int)+0x3a>
 b34:	46 8d 04 0a          	lea    (%rdx,%r9,1),%r8d
 b38:	44 89 c9             	mov    %r9d,%ecx
 b3b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 b40:	01 c8                	add    %ecx,%eax
 b42:	83 c1 01             	add    $0x1,%ecx
 b45:	44 39 c1             	cmp    %r8d,%ecx
 b48:	75 f6                	jne    b40 <mathloop(int, int, int)+0x30>
 b4a:	41 83 c2 01          	add    $0x1,%r10d
 b4e:	45 01 d9             	add    %r11d,%r9d
 b51:	44 39 d6             	cmp    %r10d,%esi
 b54:	75 da                	jne    b30 <mathloop(int, int, int)+0x20>
 b56:	41 83 c3 01          	add    $0x1,%r11d
 b5a:	44 39 df             	cmp    %r11d,%edi
 b5d:	75 c1                	jne    b20 <mathloop(int, int, int)+0x10>
 b5f:	f3 c3                	repz retq 
 b61:	f3 c3                	repz retq 
 b63:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 b6a:	00 00 00 
 b6d:	0f 1f 00             	nopl   (%rax)

0000000000000b70 <outmsg(char const*, int*)>:
 b70:	55                   	push   %rbp
 b71:	53                   	push   %rbx
 b72:	48 89 fb             	mov    %rdi,%rbx
 b75:	48 83 ec 08          	sub    $0x8,%rsp
 b79:	48 85 f6             	test   %rsi,%rsi
 b7c:	74 52                	je     bd0 <outmsg(char const*, int*)+0x60>
 b7e:	48 85 ff             	test   %rdi,%rdi
 b81:	48 89 f5             	mov    %rsi,%rbp
 b84:	0f 84 96 00 00 00    	je     c20 <outmsg(char const*, int*)+0xb0>
 b8a:	e8 11 fd ff ff       	callq  8a0 <strlen@plt>
 b8f:	48 8d 3d 8a 14 20 00 	lea    0x20148a(%rip),%rdi        # 202020 <std::cout@@GLIBCXX_3.4>
 b96:	48 89 c2             	mov    %rax,%rdx
 b99:	48 89 de             	mov    %rbx,%rsi
 b9c:	e8 3f fd ff ff       	callq  8e0 <std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@plt>
 ba1:	8b 75 00             	mov    0x0(%rbp),%esi
 ba4:	48 8d 3d 75 14 20 00 	lea    0x201475(%rip),%rdi        # 202020 <std::cout@@GLIBCXX_3.4>
 bab:	e8 60 fd ff ff       	callq  910 <std::ostream::operator<<(int)@plt>
 bb0:	48 83 c4 08          	add    $0x8,%rsp
 bb4:	48 8d 35 56 01 00 00 	lea    0x156(%rip),%rsi        # d11 <_IO_stdin_used+0x31>
 bbb:	ba 01 00 00 00       	mov    $0x1,%edx
 bc0:	5b                   	pop    %rbx
 bc1:	5d                   	pop    %rbp
 bc2:	48 89 c7             	mov    %rax,%rdi
 bc5:	e9 16 fd ff ff       	jmpq   8e0 <std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@plt>
 bca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
 bd0:	48 85 ff             	test   %rdi,%rdi
 bd3:	74 23                	je     bf8 <outmsg(char const*, int*)+0x88>
 bd5:	e8 c6 fc ff ff       	callq  8a0 <strlen@plt>
 bda:	48 83 c4 08          	add    $0x8,%rsp
 bde:	48 89 de             	mov    %rbx,%rsi
 be1:	48 8d 3d 38 14 20 00 	lea    0x201438(%rip),%rdi        # 202020 <std::cout@@GLIBCXX_3.4>
 be8:	5b                   	pop    %rbx
 be9:	5d                   	pop    %rbp
 bea:	48 89 c2             	mov    %rax,%rdx
 bed:	e9 ee fc ff ff       	jmpq   8e0 <std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@plt>
 bf2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
 bf8:	48 8b 05 21 14 20 00 	mov    0x201421(%rip),%rax        # 202020 <std::cout@@GLIBCXX_3.4>
 bff:	48 8d 3d 1a 14 20 00 	lea    0x20141a(%rip),%rdi        # 202020 <std::cout@@GLIBCXX_3.4>
 c06:	48 03 78 e8          	add    -0x18(%rax),%rdi
 c0a:	8b 77 20             	mov    0x20(%rdi),%esi
 c0d:	48 83 c4 08          	add    $0x8,%rsp
 c11:	5b                   	pop    %rbx
 c12:	5d                   	pop    %rbp
 c13:	83 ce 01             	or     $0x1,%esi
 c16:	e9 e5 fc ff ff       	jmpq   900 <std::basic_ios<char, std::char_traits<char> >::clear(std::_Ios_Iostate)@plt>
 c1b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 c20:	48 8b 05 f9 13 20 00 	mov    0x2013f9(%rip),%rax        # 202020 <std::cout@@GLIBCXX_3.4>
 c27:	48 8d 3d f2 13 20 00 	lea    0x2013f2(%rip),%rdi        # 202020 <std::cout@@GLIBCXX_3.4>
 c2e:	48 03 78 e8          	add    -0x18(%rax),%rdi
 c32:	8b 77 20             	mov    0x20(%rdi),%esi
 c35:	83 ce 01             	or     $0x1,%esi
 c38:	e8 c3 fc ff ff       	callq  900 <std::basic_ios<char, std::char_traits<char> >::clear(std::_Ios_Iostate)@plt>
 c3d:	e9 5f ff ff ff       	jmpq   ba1 <outmsg(char const*, int*)+0x31>
 c42:	0f 1f 40 00          	nopl   0x0(%rax)
 c46:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 c4d:	00 00 00 

0000000000000c50 <input(int*)>:
 c50:	48 89 fe             	mov    %rdi,%rsi
 c53:	48 8d 3d e6 14 20 00 	lea    0x2014e6(%rip),%rdi        # 202140 <std::cin@@GLIBCXX_3.4>
 c5a:	e9 51 fc ff ff       	jmpq   8b0 <std::istream::operator>>(int&)@plt>
 c5f:	90                   	nop

0000000000000c60 <__libc_csu_init>:
 c60:	41 57                	push   %r15
 c62:	41 56                	push   %r14
 c64:	49 89 d7             	mov    %rdx,%r15
 c67:	41 55                	push   %r13
 c69:	41 54                	push   %r12
 c6b:	4c 8d 25 ee 10 20 00 	lea    0x2010ee(%rip),%r12        # 201d60 <__frame_dummy_init_array_entry>
 c72:	55                   	push   %rbp
 c73:	48 8d 2d f6 10 20 00 	lea    0x2010f6(%rip),%rbp        # 201d70 <__init_array_end>
 c7a:	53                   	push   %rbx
 c7b:	41 89 fd             	mov    %edi,%r13d
 c7e:	49 89 f6             	mov    %rsi,%r14
 c81:	4c 29 e5             	sub    %r12,%rbp
 c84:	48 83 ec 08          	sub    $0x8,%rsp
 c88:	48 c1 fd 03          	sar    $0x3,%rbp
 c8c:	e8 e7 fb ff ff       	callq  878 <_init>
 c91:	48 85 ed             	test   %rbp,%rbp
 c94:	74 20                	je     cb6 <__libc_csu_init+0x56>
 c96:	31 db                	xor    %ebx,%ebx
 c98:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 c9f:	00 
 ca0:	4c 89 fa             	mov    %r15,%rdx
 ca3:	4c 89 f6             	mov    %r14,%rsi
 ca6:	44 89 ef             	mov    %r13d,%edi
 ca9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
 cad:	48 83 c3 01          	add    $0x1,%rbx
 cb1:	48 39 dd             	cmp    %rbx,%rbp
 cb4:	75 ea                	jne    ca0 <__libc_csu_init+0x40>
 cb6:	48 83 c4 08          	add    $0x8,%rsp
 cba:	5b                   	pop    %rbx
 cbb:	5d                   	pop    %rbp
 cbc:	41 5c                	pop    %r12
 cbe:	41 5d                	pop    %r13
 cc0:	41 5e                	pop    %r14
 cc2:	41 5f                	pop    %r15
 cc4:	c3                   	retq   
 cc5:	90                   	nop
 cc6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 ccd:	00 00 00 

0000000000000cd0 <__libc_csu_fini>:
 cd0:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000000cd4 <_fini>:
 cd4:	48 83 ec 08          	sub    $0x8,%rsp
 cd8:	48 83 c4 08          	add    $0x8,%rsp
 cdc:	c3                   	retq   
