
progO1:     file format elf64-x86-64


Disassembly of section .init:

0000000000000838 <_init>:
 838:	48 83 ec 08          	sub    $0x8,%rsp
 83c:	48 8b 05 a5 17 20 00 	mov    0x2017a5(%rip),%rax        # 201fe8 <__gmon_start__>
 843:	48 85 c0             	test   %rax,%rax
 846:	74 02                	je     84a <_init+0x12>
 848:	ff d0                	callq  *%rax
 84a:	48 83 c4 08          	add    $0x8,%rsp
 84e:	c3                   	retq   

Disassembly of section .plt:

0000000000000850 <.plt>:
 850:	ff 35 32 17 20 00    	pushq  0x201732(%rip)        # 201f88 <_GLOBAL_OFFSET_TABLE_+0x8>
 856:	ff 25 34 17 20 00    	jmpq   *0x201734(%rip)        # 201f90 <_GLOBAL_OFFSET_TABLE_+0x10>
 85c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000860 <std::istream::operator>>(int&)@plt>:
 860:	ff 25 32 17 20 00    	jmpq   *0x201732(%rip)        # 201f98 <std::istream::operator>>(int&)@GLIBCXX_3.4>
 866:	68 00 00 00 00       	pushq  $0x0
 86b:	e9 e0 ff ff ff       	jmpq   850 <.plt>

0000000000000870 <__cxa_atexit@plt>:
 870:	ff 25 2a 17 20 00    	jmpq   *0x20172a(%rip)        # 201fa0 <__cxa_atexit@GLIBC_2.2.5>
 876:	68 01 00 00 00       	pushq  $0x1
 87b:	e9 d0 ff ff ff       	jmpq   850 <.plt>

0000000000000880 <__stack_chk_fail@plt>:
 880:	ff 25 22 17 20 00    	jmpq   *0x201722(%rip)        # 201fa8 <__stack_chk_fail@GLIBC_2.4>
 886:	68 02 00 00 00       	pushq  $0x2
 88b:	e9 c0 ff ff ff       	jmpq   850 <.plt>

0000000000000890 <std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@plt>:
 890:	ff 25 1a 17 20 00    	jmpq   *0x20171a(%rip)        # 201fb0 <std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@GLIBCXX_3.4.9>
 896:	68 03 00 00 00       	pushq  $0x3
 89b:	e9 b0 ff ff ff       	jmpq   850 <.plt>

00000000000008a0 <std::ios_base::Init::Init()@plt>:
 8a0:	ff 25 12 17 20 00    	jmpq   *0x201712(%rip)        # 201fb8 <std::ios_base::Init::Init()@GLIBCXX_3.4>
 8a6:	68 04 00 00 00       	pushq  $0x4
 8ab:	e9 a0 ff ff ff       	jmpq   850 <.plt>

00000000000008b0 <std::basic_ios<char, std::char_traits<char> >::clear(std::_Ios_Iostate)@plt>:
 8b0:	ff 25 0a 17 20 00    	jmpq   *0x20170a(%rip)        # 201fc0 <std::basic_ios<char, std::char_traits<char> >::clear(std::_Ios_Iostate)@GLIBCXX_3.4>
 8b6:	68 05 00 00 00       	pushq  $0x5
 8bb:	e9 90 ff ff ff       	jmpq   850 <.plt>

00000000000008c0 <std::ostream::operator<<(int)@plt>:
 8c0:	ff 25 02 17 20 00    	jmpq   *0x201702(%rip)        # 201fc8 <std::ostream::operator<<(int)@GLIBCXX_3.4>
 8c6:	68 06 00 00 00       	pushq  $0x6
 8cb:	e9 80 ff ff ff       	jmpq   850 <.plt>

Disassembly of section .plt.got:

00000000000008d0 <__cxa_finalize@plt>:
 8d0:	ff 25 fa 16 20 00    	jmpq   *0x2016fa(%rip)        # 201fd0 <__cxa_finalize@GLIBC_2.2.5>
 8d6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

00000000000008e0 <_start>:
 8e0:	31 ed                	xor    %ebp,%ebp
 8e2:	49 89 d1             	mov    %rdx,%r9
 8e5:	5e                   	pop    %rsi
 8e6:	48 89 e2             	mov    %rsp,%rdx
 8e9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
 8ed:	50                   	push   %rax
 8ee:	54                   	push   %rsp
 8ef:	4c 8d 05 7a 03 00 00 	lea    0x37a(%rip),%r8        # c70 <__libc_csu_fini>
 8f6:	48 8d 0d 03 03 00 00 	lea    0x303(%rip),%rcx        # c00 <__libc_csu_init>
 8fd:	48 8d 3d e6 00 00 00 	lea    0xe6(%rip),%rdi        # 9ea <main>
 904:	ff 15 d6 16 20 00    	callq  *0x2016d6(%rip)        # 201fe0 <__libc_start_main@GLIBC_2.2.5>
 90a:	f4                   	hlt    
 90b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000910 <deregister_tm_clones>:
 910:	48 8d 3d f9 16 20 00 	lea    0x2016f9(%rip),%rdi        # 202010 <__TMC_END__>
 917:	55                   	push   %rbp
 918:	48 8d 05 f1 16 20 00 	lea    0x2016f1(%rip),%rax        # 202010 <__TMC_END__>
 91f:	48 39 f8             	cmp    %rdi,%rax
 922:	48 89 e5             	mov    %rsp,%rbp
 925:	74 19                	je     940 <deregister_tm_clones+0x30>
 927:	48 8b 05 aa 16 20 00 	mov    0x2016aa(%rip),%rax        # 201fd8 <_ITM_deregisterTMCloneTable>
 92e:	48 85 c0             	test   %rax,%rax
 931:	74 0d                	je     940 <deregister_tm_clones+0x30>
 933:	5d                   	pop    %rbp
 934:	ff e0                	jmpq   *%rax
 936:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 93d:	00 00 00 
 940:	5d                   	pop    %rbp
 941:	c3                   	retq   
 942:	0f 1f 40 00          	nopl   0x0(%rax)
 946:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 94d:	00 00 00 

0000000000000950 <register_tm_clones>:
 950:	48 8d 3d b9 16 20 00 	lea    0x2016b9(%rip),%rdi        # 202010 <__TMC_END__>
 957:	48 8d 35 b2 16 20 00 	lea    0x2016b2(%rip),%rsi        # 202010 <__TMC_END__>
 95e:	55                   	push   %rbp
 95f:	48 29 fe             	sub    %rdi,%rsi
 962:	48 89 e5             	mov    %rsp,%rbp
 965:	48 c1 fe 03          	sar    $0x3,%rsi
 969:	48 89 f0             	mov    %rsi,%rax
 96c:	48 c1 e8 3f          	shr    $0x3f,%rax
 970:	48 01 c6             	add    %rax,%rsi
 973:	48 d1 fe             	sar    %rsi
 976:	74 18                	je     990 <register_tm_clones+0x40>
 978:	48 8b 05 71 16 20 00 	mov    0x201671(%rip),%rax        # 201ff0 <_ITM_registerTMCloneTable>
 97f:	48 85 c0             	test   %rax,%rax
 982:	74 0c                	je     990 <register_tm_clones+0x40>
 984:	5d                   	pop    %rbp
 985:	ff e0                	jmpq   *%rax
 987:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
 98e:	00 00 
 990:	5d                   	pop    %rbp
 991:	c3                   	retq   
 992:	0f 1f 40 00          	nopl   0x0(%rax)
 996:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 99d:	00 00 00 

00000000000009a0 <__do_global_dtors_aux>:
 9a0:	80 3d b1 18 20 00 00 	cmpb   $0x0,0x2018b1(%rip)        # 202258 <completed.7697>
 9a7:	75 2f                	jne    9d8 <__do_global_dtors_aux+0x38>
 9a9:	48 83 3d 1f 16 20 00 	cmpq   $0x0,0x20161f(%rip)        # 201fd0 <__cxa_finalize@GLIBC_2.2.5>
 9b0:	00 
 9b1:	55                   	push   %rbp
 9b2:	48 89 e5             	mov    %rsp,%rbp
 9b5:	74 0c                	je     9c3 <__do_global_dtors_aux+0x23>
 9b7:	48 8b 3d 4a 16 20 00 	mov    0x20164a(%rip),%rdi        # 202008 <__dso_handle>
 9be:	e8 0d ff ff ff       	callq  8d0 <__cxa_finalize@plt>
 9c3:	e8 48 ff ff ff       	callq  910 <deregister_tm_clones>
 9c8:	c6 05 89 18 20 00 01 	movb   $0x1,0x201889(%rip)        # 202258 <completed.7697>
 9cf:	5d                   	pop    %rbp
 9d0:	c3                   	retq   
 9d1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
 9d8:	f3 c3                	repz retq 
 9da:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000009e0 <frame_dummy>:
 9e0:	55                   	push   %rbp
 9e1:	48 89 e5             	mov    %rsp,%rbp
 9e4:	5d                   	pop    %rbp
 9e5:	e9 66 ff ff ff       	jmpq   950 <register_tm_clones>

00000000000009ea <main>:
 9ea:	48 83 ec 28          	sub    $0x28,%rsp
 9ee:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
 9f5:	00 00 
 9f7:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
 9fc:	31 c0                	xor    %eax,%eax
 9fe:	be 00 00 00 00       	mov    $0x0,%esi
 a03:	48 8d 3d 7a 02 00 00 	lea    0x27a(%rip),%rdi        # c84 <_IO_stdin_used+0x4>
 a0a:	e8 d7 00 00 00       	callq  ae6 <outmsg(char const*, int*)>
 a0f:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
 a14:	e8 9c 01 00 00       	callq  bb5 <input(int*)>
 a19:	be 00 00 00 00       	mov    $0x0,%esi
 a1e:	48 8d 3d 76 02 00 00 	lea    0x276(%rip),%rdi        # c9b <_IO_stdin_used+0x1b>
 a25:	e8 bc 00 00 00       	callq  ae6 <outmsg(char const*, int*)>
 a2a:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
 a2f:	e8 81 01 00 00       	callq  bb5 <input(int*)>
 a34:	be 00 00 00 00       	mov    $0x0,%esi
 a39:	48 8d 3d 73 02 00 00 	lea    0x273(%rip),%rdi        # cb3 <_IO_stdin_used+0x33>
 a40:	e8 a1 00 00 00       	callq  ae6 <outmsg(char const*, int*)>
 a45:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
 a4a:	e8 66 01 00 00       	callq  bb5 <input(int*)>
 a4f:	8b 54 24 10          	mov    0x10(%rsp),%edx
 a53:	8b 74 24 0c          	mov    0xc(%rsp),%esi
 a57:	8b 7c 24 08          	mov    0x8(%rsp),%edi
 a5b:	e8 34 00 00 00       	callq  a94 <mathloop(int, int, int)>
 a60:	89 44 24 14          	mov    %eax,0x14(%rsp)
 a64:	48 8d 74 24 14       	lea    0x14(%rsp),%rsi
 a69:	48 8d 3d 5a 02 00 00 	lea    0x25a(%rip),%rdi        # cca <_IO_stdin_used+0x4a>
 a70:	e8 71 00 00 00       	callq  ae6 <outmsg(char const*, int*)>
 a75:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
 a7a:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
 a81:	00 00 
 a83:	75 0a                	jne    a8f <main+0xa5>
 a85:	b8 00 00 00 00       	mov    $0x0,%eax
 a8a:	48 83 c4 28          	add    $0x28,%rsp
 a8e:	c3                   	retq   
 a8f:	e8 ec fd ff ff       	callq  880 <__stack_chk_fail@plt>

0000000000000a94 <mathloop(int, int, int)>:
 a94:	85 ff                	test   %edi,%edi
 a96:	7e 48                	jle    ae0 <mathloop(int, int, int)+0x4c>
 a98:	53                   	push   %rbx
 a99:	b8 00 00 00 00       	mov    $0x0,%eax
 a9e:	bb 00 00 00 00       	mov    $0x0,%ebx
 aa3:	85 f6                	test   %esi,%esi
 aa5:	7e 30                	jle    ad7 <mathloop(int, int, int)+0x43>
 aa7:	41 89 db             	mov    %ebx,%r11d
 aaa:	41 b9 00 00 00 00    	mov    $0x0,%r9d
 ab0:	41 ba 00 00 00 00    	mov    $0x0,%r10d
 ab6:	85 d2                	test   %edx,%edx
 ab8:	7e 11                	jle    acb <mathloop(int, int, int)+0x37>
 aba:	46 8d 04 0a          	lea    (%rdx,%r9,1),%r8d
 abe:	44 89 c9             	mov    %r9d,%ecx
 ac1:	01 c8                	add    %ecx,%eax
 ac3:	83 c1 01             	add    $0x1,%ecx
 ac6:	44 39 c1             	cmp    %r8d,%ecx
 ac9:	75 f6                	jne    ac1 <mathloop(int, int, int)+0x2d>
 acb:	41 83 c2 01          	add    $0x1,%r10d
 acf:	45 01 d9             	add    %r11d,%r9d
 ad2:	44 39 d6             	cmp    %r10d,%esi
 ad5:	75 df                	jne    ab6 <mathloop(int, int, int)+0x22>
 ad7:	83 c3 01             	add    $0x1,%ebx
 ada:	39 df                	cmp    %ebx,%edi
 adc:	75 c5                	jne    aa3 <mathloop(int, int, int)+0xf>
 ade:	5b                   	pop    %rbx
 adf:	c3                   	retq   
 ae0:	b8 00 00 00 00       	mov    $0x0,%eax
 ae5:	c3                   	retq   

0000000000000ae6 <outmsg(char const*, int*)>:
 ae6:	53                   	push   %rbx
 ae7:	49 89 f8             	mov    %rdi,%r8
 aea:	48 85 f6             	test   %rsi,%rsi
 aed:	74 57                	je     b46 <outmsg(char const*, int*)+0x60>
 aef:	48 89 f3             	mov    %rsi,%rbx
 af2:	48 85 ff             	test   %rdi,%rdi
 af5:	0f 84 98 00 00 00    	je     b93 <outmsg(char const*, int*)+0xad>
 afb:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
 b02:	b8 00 00 00 00       	mov    $0x0,%eax
 b07:	f2 ae                	repnz scas %es:(%rdi),%al
 b09:	48 89 ca             	mov    %rcx,%rdx
 b0c:	48 f7 d2             	not    %rdx
 b0f:	48 8d 52 ff          	lea    -0x1(%rdx),%rdx
 b13:	4c 89 c6             	mov    %r8,%rsi
 b16:	48 8d 3d 03 15 20 00 	lea    0x201503(%rip),%rdi        # 202020 <std::cout@@GLIBCXX_3.4>
 b1d:	e8 6e fd ff ff       	callq  890 <std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@plt>
 b22:	8b 33                	mov    (%rbx),%esi
 b24:	48 8d 3d f5 14 20 00 	lea    0x2014f5(%rip),%rdi        # 202020 <std::cout@@GLIBCXX_3.4>
 b2b:	e8 90 fd ff ff       	callq  8c0 <std::ostream::operator<<(int)@plt>
 b30:	ba 01 00 00 00       	mov    $0x1,%edx
 b35:	48 8d 35 75 01 00 00 	lea    0x175(%rip),%rsi        # cb1 <_IO_stdin_used+0x31>
 b3c:	48 89 c7             	mov    %rax,%rdi
 b3f:	e8 4c fd ff ff       	callq  890 <std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@plt>
 b44:	5b                   	pop    %rbx
 b45:	c3                   	retq   
 b46:	48 85 ff             	test   %rdi,%rdi
 b49:	74 29                	je     b74 <outmsg(char const*, int*)+0x8e>
 b4b:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
 b52:	b8 00 00 00 00       	mov    $0x0,%eax
 b57:	f2 ae                	repnz scas %es:(%rdi),%al
 b59:	48 89 cb             	mov    %rcx,%rbx
 b5c:	48 f7 d3             	not    %rbx
 b5f:	48 8d 53 ff          	lea    -0x1(%rbx),%rdx
 b63:	4c 89 c6             	mov    %r8,%rsi
 b66:	48 8d 3d b3 14 20 00 	lea    0x2014b3(%rip),%rdi        # 202020 <std::cout@@GLIBCXX_3.4>
 b6d:	e8 1e fd ff ff       	callq  890 <std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@plt>
 b72:	eb d0                	jmp    b44 <outmsg(char const*, int*)+0x5e>
 b74:	48 8d 3d a5 14 20 00 	lea    0x2014a5(%rip),%rdi        # 202020 <std::cout@@GLIBCXX_3.4>
 b7b:	48 8b 05 9e 14 20 00 	mov    0x20149e(%rip),%rax        # 202020 <std::cout@@GLIBCXX_3.4>
 b82:	48 03 78 e8          	add    -0x18(%rax),%rdi
 b86:	8b 77 20             	mov    0x20(%rdi),%esi
 b89:	83 ce 01             	or     $0x1,%esi
 b8c:	e8 1f fd ff ff       	callq  8b0 <std::basic_ios<char, std::char_traits<char> >::clear(std::_Ios_Iostate)@plt>
 b91:	eb b1                	jmp    b44 <outmsg(char const*, int*)+0x5e>
 b93:	48 8d 3d 86 14 20 00 	lea    0x201486(%rip),%rdi        # 202020 <std::cout@@GLIBCXX_3.4>
 b9a:	48 8b 05 7f 14 20 00 	mov    0x20147f(%rip),%rax        # 202020 <std::cout@@GLIBCXX_3.4>
 ba1:	48 03 78 e8          	add    -0x18(%rax),%rdi
 ba5:	8b 77 20             	mov    0x20(%rdi),%esi
 ba8:	83 ce 01             	or     $0x1,%esi
 bab:	e8 00 fd ff ff       	callq  8b0 <std::basic_ios<char, std::char_traits<char> >::clear(std::_Ios_Iostate)@plt>
 bb0:	e9 6d ff ff ff       	jmpq   b22 <outmsg(char const*, int*)+0x3c>

0000000000000bb5 <input(int*)>:
 bb5:	48 83 ec 08          	sub    $0x8,%rsp
 bb9:	48 89 fe             	mov    %rdi,%rsi
 bbc:	48 8d 3d 7d 15 20 00 	lea    0x20157d(%rip),%rdi        # 202140 <std::cin@@GLIBCXX_3.4>
 bc3:	e8 98 fc ff ff       	callq  860 <std::istream::operator>>(int&)@plt>
 bc8:	48 83 c4 08          	add    $0x8,%rsp
 bcc:	c3                   	retq   

0000000000000bcd <_GLOBAL__sub_I__Z6outmsgPKcPi>:
 bcd:	48 83 ec 08          	sub    $0x8,%rsp
 bd1:	48 8d 3d 81 16 20 00 	lea    0x201681(%rip),%rdi        # 202259 <std::__ioinit>
 bd8:	e8 c3 fc ff ff       	callq  8a0 <std::ios_base::Init::Init()@plt>
 bdd:	48 8d 15 24 14 20 00 	lea    0x201424(%rip),%rdx        # 202008 <__dso_handle>
 be4:	48 8d 35 6e 16 20 00 	lea    0x20166e(%rip),%rsi        # 202259 <std::__ioinit>
 beb:	48 8b 3d 06 14 20 00 	mov    0x201406(%rip),%rdi        # 201ff8 <std::ios_base::Init::~Init()@GLIBCXX_3.4>
 bf2:	e8 79 fc ff ff       	callq  870 <__cxa_atexit@plt>
 bf7:	48 83 c4 08          	add    $0x8,%rsp
 bfb:	c3                   	retq   
 bfc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000c00 <__libc_csu_init>:
 c00:	41 57                	push   %r15
 c02:	41 56                	push   %r14
 c04:	49 89 d7             	mov    %rdx,%r15
 c07:	41 55                	push   %r13
 c09:	41 54                	push   %r12
 c0b:	4c 8d 25 56 11 20 00 	lea    0x201156(%rip),%r12        # 201d68 <__frame_dummy_init_array_entry>
 c12:	55                   	push   %rbp
 c13:	48 8d 2d 5e 11 20 00 	lea    0x20115e(%rip),%rbp        # 201d78 <__init_array_end>
 c1a:	53                   	push   %rbx
 c1b:	41 89 fd             	mov    %edi,%r13d
 c1e:	49 89 f6             	mov    %rsi,%r14
 c21:	4c 29 e5             	sub    %r12,%rbp
 c24:	48 83 ec 08          	sub    $0x8,%rsp
 c28:	48 c1 fd 03          	sar    $0x3,%rbp
 c2c:	e8 07 fc ff ff       	callq  838 <_init>
 c31:	48 85 ed             	test   %rbp,%rbp
 c34:	74 20                	je     c56 <__libc_csu_init+0x56>
 c36:	31 db                	xor    %ebx,%ebx
 c38:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 c3f:	00 
 c40:	4c 89 fa             	mov    %r15,%rdx
 c43:	4c 89 f6             	mov    %r14,%rsi
 c46:	44 89 ef             	mov    %r13d,%edi
 c49:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
 c4d:	48 83 c3 01          	add    $0x1,%rbx
 c51:	48 39 dd             	cmp    %rbx,%rbp
 c54:	75 ea                	jne    c40 <__libc_csu_init+0x40>
 c56:	48 83 c4 08          	add    $0x8,%rsp
 c5a:	5b                   	pop    %rbx
 c5b:	5d                   	pop    %rbp
 c5c:	41 5c                	pop    %r12
 c5e:	41 5d                	pop    %r13
 c60:	41 5e                	pop    %r14
 c62:	41 5f                	pop    %r15
 c64:	c3                   	retq   
 c65:	90                   	nop
 c66:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 c6d:	00 00 00 

0000000000000c70 <__libc_csu_fini>:
 c70:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000000c74 <_fini>:
 c74:	48 83 ec 08          	sub    $0x8,%rsp
 c78:	48 83 c4 08          	add    $0x8,%rsp
 c7c:	c3                   	retq   
