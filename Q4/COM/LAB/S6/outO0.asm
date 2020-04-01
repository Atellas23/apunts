
progO0:     file format elf64-x86-64


Disassembly of section .init:

0000000000000798 <_init>:
 798:	48 83 ec 08          	sub    $0x8,%rsp
 79c:	48 8b 05 45 18 20 00 	mov    0x201845(%rip),%rax        # 201fe8 <__gmon_start__>
 7a3:	48 85 c0             	test   %rax,%rax
 7a6:	74 02                	je     7aa <_init+0x12>
 7a8:	ff d0                	callq  *%rax
 7aa:	48 83 c4 08          	add    $0x8,%rsp
 7ae:	c3                   	retq   

Disassembly of section .plt:

00000000000007b0 <.plt>:
 7b0:	ff 35 da 17 20 00    	pushq  0x2017da(%rip)        # 201f90 <_GLOBAL_OFFSET_TABLE_+0x8>
 7b6:	ff 25 dc 17 20 00    	jmpq   *0x2017dc(%rip)        # 201f98 <_GLOBAL_OFFSET_TABLE_+0x10>
 7bc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000007c0 <std::istream::operator>>(int&)@plt>:
 7c0:	ff 25 da 17 20 00    	jmpq   *0x2017da(%rip)        # 201fa0 <std::istream::operator>>(int&)@GLIBCXX_3.4>
 7c6:	68 00 00 00 00       	pushq  $0x0
 7cb:	e9 e0 ff ff ff       	jmpq   7b0 <.plt>

00000000000007d0 <__cxa_atexit@plt>:
 7d0:	ff 25 d2 17 20 00    	jmpq   *0x2017d2(%rip)        # 201fa8 <__cxa_atexit@GLIBC_2.2.5>
 7d6:	68 01 00 00 00       	pushq  $0x1
 7db:	e9 d0 ff ff ff       	jmpq   7b0 <.plt>

00000000000007e0 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>:
 7e0:	ff 25 ca 17 20 00    	jmpq   *0x2017ca(%rip)        # 201fb0 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@GLIBCXX_3.4>
 7e6:	68 02 00 00 00       	pushq  $0x2
 7eb:	e9 c0 ff ff ff       	jmpq   7b0 <.plt>

00000000000007f0 <__stack_chk_fail@plt>:
 7f0:	ff 25 c2 17 20 00    	jmpq   *0x2017c2(%rip)        # 201fb8 <__stack_chk_fail@GLIBC_2.4>
 7f6:	68 03 00 00 00       	pushq  $0x3
 7fb:	e9 b0 ff ff ff       	jmpq   7b0 <.plt>

0000000000000800 <std::ios_base::Init::Init()@plt>:
 800:	ff 25 ba 17 20 00    	jmpq   *0x2017ba(%rip)        # 201fc0 <std::ios_base::Init::Init()@GLIBCXX_3.4>
 806:	68 04 00 00 00       	pushq  $0x4
 80b:	e9 a0 ff ff ff       	jmpq   7b0 <.plt>

0000000000000810 <std::ostream::operator<<(int)@plt>:
 810:	ff 25 b2 17 20 00    	jmpq   *0x2017b2(%rip)        # 201fc8 <std::ostream::operator<<(int)@GLIBCXX_3.4>
 816:	68 05 00 00 00       	pushq  $0x5
 81b:	e9 90 ff ff ff       	jmpq   7b0 <.plt>

Disassembly of section .plt.got:

0000000000000820 <__cxa_finalize@plt>:
 820:	ff 25 aa 17 20 00    	jmpq   *0x2017aa(%rip)        # 201fd0 <__cxa_finalize@GLIBC_2.2.5>
 826:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000000830 <_start>:
 830:	31 ed                	xor    %ebp,%ebp
 832:	49 89 d1             	mov    %rdx,%r9
 835:	5e                   	pop    %rsi
 836:	48 89 e2             	mov    %rsp,%rdx
 839:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
 83d:	50                   	push   %rax
 83e:	54                   	push   %rsp
 83f:	4c 8d 05 6a 03 00 00 	lea    0x36a(%rip),%r8        # bb0 <__libc_csu_fini>
 846:	48 8d 0d f3 02 00 00 	lea    0x2f3(%rip),%rcx        # b40 <__libc_csu_init>
 84d:	48 8d 3d e6 00 00 00 	lea    0xe6(%rip),%rdi        # 93a <main>
 854:	ff 15 86 17 20 00    	callq  *0x201786(%rip)        # 201fe0 <__libc_start_main@GLIBC_2.2.5>
 85a:	f4                   	hlt    
 85b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000860 <deregister_tm_clones>:
 860:	48 8d 3d a9 17 20 00 	lea    0x2017a9(%rip),%rdi        # 202010 <__TMC_END__>
 867:	55                   	push   %rbp
 868:	48 8d 05 a1 17 20 00 	lea    0x2017a1(%rip),%rax        # 202010 <__TMC_END__>
 86f:	48 39 f8             	cmp    %rdi,%rax
 872:	48 89 e5             	mov    %rsp,%rbp
 875:	74 19                	je     890 <deregister_tm_clones+0x30>
 877:	48 8b 05 5a 17 20 00 	mov    0x20175a(%rip),%rax        # 201fd8 <_ITM_deregisterTMCloneTable>
 87e:	48 85 c0             	test   %rax,%rax
 881:	74 0d                	je     890 <deregister_tm_clones+0x30>
 883:	5d                   	pop    %rbp
 884:	ff e0                	jmpq   *%rax
 886:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 88d:	00 00 00 
 890:	5d                   	pop    %rbp
 891:	c3                   	retq   
 892:	0f 1f 40 00          	nopl   0x0(%rax)
 896:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 89d:	00 00 00 

00000000000008a0 <register_tm_clones>:
 8a0:	48 8d 3d 69 17 20 00 	lea    0x201769(%rip),%rdi        # 202010 <__TMC_END__>
 8a7:	48 8d 35 62 17 20 00 	lea    0x201762(%rip),%rsi        # 202010 <__TMC_END__>
 8ae:	55                   	push   %rbp
 8af:	48 29 fe             	sub    %rdi,%rsi
 8b2:	48 89 e5             	mov    %rsp,%rbp
 8b5:	48 c1 fe 03          	sar    $0x3,%rsi
 8b9:	48 89 f0             	mov    %rsi,%rax
 8bc:	48 c1 e8 3f          	shr    $0x3f,%rax
 8c0:	48 01 c6             	add    %rax,%rsi
 8c3:	48 d1 fe             	sar    %rsi
 8c6:	74 18                	je     8e0 <register_tm_clones+0x40>
 8c8:	48 8b 05 21 17 20 00 	mov    0x201721(%rip),%rax        # 201ff0 <_ITM_registerTMCloneTable>
 8cf:	48 85 c0             	test   %rax,%rax
 8d2:	74 0c                	je     8e0 <register_tm_clones+0x40>
 8d4:	5d                   	pop    %rbp
 8d5:	ff e0                	jmpq   *%rax
 8d7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
 8de:	00 00 
 8e0:	5d                   	pop    %rbp
 8e1:	c3                   	retq   
 8e2:	0f 1f 40 00          	nopl   0x0(%rax)
 8e6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 8ed:	00 00 00 

00000000000008f0 <__do_global_dtors_aux>:
 8f0:	80 3d 61 19 20 00 00 	cmpb   $0x0,0x201961(%rip)        # 202258 <completed.7697>
 8f7:	75 2f                	jne    928 <__do_global_dtors_aux+0x38>
 8f9:	48 83 3d cf 16 20 00 	cmpq   $0x0,0x2016cf(%rip)        # 201fd0 <__cxa_finalize@GLIBC_2.2.5>
 900:	00 
 901:	55                   	push   %rbp
 902:	48 89 e5             	mov    %rsp,%rbp
 905:	74 0c                	je     913 <__do_global_dtors_aux+0x23>
 907:	48 8b 3d fa 16 20 00 	mov    0x2016fa(%rip),%rdi        # 202008 <__dso_handle>
 90e:	e8 0d ff ff ff       	callq  820 <__cxa_finalize@plt>
 913:	e8 48 ff ff ff       	callq  860 <deregister_tm_clones>
 918:	c6 05 39 19 20 00 01 	movb   $0x1,0x201939(%rip)        # 202258 <completed.7697>
 91f:	5d                   	pop    %rbp
 920:	c3                   	retq   
 921:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
 928:	f3 c3                	repz retq 
 92a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000930 <frame_dummy>:
 930:	55                   	push   %rbp
 931:	48 89 e5             	mov    %rsp,%rbp
 934:	5d                   	pop    %rbp
 935:	e9 66 ff ff ff       	jmpq   8a0 <register_tm_clones>

000000000000093a <main>:
 93a:	55                   	push   %rbp
 93b:	48 89 e5             	mov    %rsp,%rbp
 93e:	48 83 ec 30          	sub    $0x30,%rsp
 942:	89 7d dc             	mov    %edi,-0x24(%rbp)
 945:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
 949:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
 950:	00 00 
 952:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 956:	31 c0                	xor    %eax,%eax
 958:	be 00 00 00 00       	mov    $0x0,%esi
 95d:	48 8d 3d 60 02 00 00 	lea    0x260(%rip),%rdi        # bc4 <_IO_stdin_used+0x4>
 964:	e8 f2 00 00 00       	callq  a5b <outmsg(char const*, int*)>
 969:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
 96d:	48 89 c7             	mov    %rax,%rdi
 970:	e8 4a 01 00 00       	callq  abf <input(int*)>
 975:	be 00 00 00 00       	mov    $0x0,%esi
 97a:	48 8d 3d 5a 02 00 00 	lea    0x25a(%rip),%rdi        # bdb <_IO_stdin_used+0x1b>
 981:	e8 d5 00 00 00       	callq  a5b <outmsg(char const*, int*)>
 986:	48 8d 45 ec          	lea    -0x14(%rbp),%rax
 98a:	48 89 c7             	mov    %rax,%rdi
 98d:	e8 2d 01 00 00       	callq  abf <input(int*)>
 992:	be 00 00 00 00       	mov    $0x0,%esi
 997:	48 8d 3d 55 02 00 00 	lea    0x255(%rip),%rdi        # bf3 <_IO_stdin_used+0x33>
 99e:	e8 b8 00 00 00       	callq  a5b <outmsg(char const*, int*)>
 9a3:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
 9a7:	48 89 c7             	mov    %rax,%rdi
 9aa:	e8 10 01 00 00       	callq  abf <input(int*)>
 9af:	8b 55 f0             	mov    -0x10(%rbp),%edx
 9b2:	8b 4d ec             	mov    -0x14(%rbp),%ecx
 9b5:	8b 45 e8             	mov    -0x18(%rbp),%eax
 9b8:	89 ce                	mov    %ecx,%esi
 9ba:	89 c7                	mov    %eax,%edi
 9bc:	e8 31 00 00 00       	callq  9f2 <mathloop(int, int, int)>
 9c1:	89 45 f4             	mov    %eax,-0xc(%rbp)
 9c4:	48 8d 45 f4          	lea    -0xc(%rbp),%rax
 9c8:	48 89 c6             	mov    %rax,%rsi
 9cb:	48 8d 3d 38 02 00 00 	lea    0x238(%rip),%rdi        # c0a <_IO_stdin_used+0x4a>
 9d2:	e8 84 00 00 00       	callq  a5b <outmsg(char const*, int*)>
 9d7:	b8 00 00 00 00       	mov    $0x0,%eax
 9dc:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
 9e0:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
 9e7:	00 00 
 9e9:	74 05                	je     9f0 <main+0xb6>
 9eb:	e8 00 fe ff ff       	callq  7f0 <__stack_chk_fail@plt>
 9f0:	c9                   	leaveq 
 9f1:	c3                   	retq   

00000000000009f2 <mathloop(int, int, int)>:
 9f2:	55                   	push   %rbp
 9f3:	48 89 e5             	mov    %rsp,%rbp
 9f6:	89 7d ec             	mov    %edi,-0x14(%rbp)
 9f9:	89 75 e8             	mov    %esi,-0x18(%rbp)
 9fc:	89 55 e4             	mov    %edx,-0x1c(%rbp)
 9ff:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
 a06:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
 a0d:	8b 45 f0             	mov    -0x10(%rbp),%eax
 a10:	3b 45 ec             	cmp    -0x14(%rbp),%eax
 a13:	7d 41                	jge    a56 <mathloop(int, int, int)+0x64>
 a15:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
 a1c:	8b 45 f4             	mov    -0xc(%rbp),%eax
 a1f:	3b 45 e8             	cmp    -0x18(%rbp),%eax
 a22:	7d 2c                	jge    a50 <mathloop(int, int, int)+0x5e>
 a24:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
 a2b:	8b 45 f8             	mov    -0x8(%rbp),%eax
 a2e:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
 a31:	7d 17                	jge    a4a <mathloop(int, int, int)+0x58>
 a33:	8b 45 f0             	mov    -0x10(%rbp),%eax
 a36:	0f af 45 f4          	imul   -0xc(%rbp),%eax
 a3a:	89 c2                	mov    %eax,%edx
 a3c:	8b 45 f8             	mov    -0x8(%rbp),%eax
 a3f:	01 d0                	add    %edx,%eax
 a41:	01 45 fc             	add    %eax,-0x4(%rbp)
 a44:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
 a48:	eb e1                	jmp    a2b <mathloop(int, int, int)+0x39>
 a4a:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
 a4e:	eb cc                	jmp    a1c <mathloop(int, int, int)+0x2a>
 a50:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
 a54:	eb b7                	jmp    a0d <mathloop(int, int, int)+0x1b>
 a56:	8b 45 fc             	mov    -0x4(%rbp),%eax
 a59:	5d                   	pop    %rbp
 a5a:	c3                   	retq   

0000000000000a5b <outmsg(char const*, int*)>:
 a5b:	55                   	push   %rbp
 a5c:	48 89 e5             	mov    %rsp,%rbp
 a5f:	48 83 ec 10          	sub    $0x10,%rsp
 a63:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 a67:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
 a6b:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
 a70:	75 15                	jne    a87 <outmsg(char const*, int*)+0x2c>
 a72:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 a76:	48 89 c6             	mov    %rax,%rsi
 a79:	48 8d 3d a0 15 20 00 	lea    0x2015a0(%rip),%rdi        # 202020 <std::cout@@GLIBCXX_3.4>
 a80:	e8 5b fd ff ff       	callq  7e0 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
 a85:	eb 35                	jmp    abc <outmsg(char const*, int*)+0x61>
 a87:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 a8b:	48 89 c6             	mov    %rax,%rsi
 a8e:	48 8d 3d 8b 15 20 00 	lea    0x20158b(%rip),%rdi        # 202020 <std::cout@@GLIBCXX_3.4>
 a95:	e8 46 fd ff ff       	callq  7e0 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
 a9a:	48 89 c2             	mov    %rax,%rdx
 a9d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 aa1:	8b 00                	mov    (%rax),%eax
 aa3:	89 c6                	mov    %eax,%esi
 aa5:	48 89 d7             	mov    %rdx,%rdi
 aa8:	e8 63 fd ff ff       	callq  810 <std::ostream::operator<<(int)@plt>
 aad:	48 8d 35 65 01 00 00 	lea    0x165(%rip),%rsi        # c19 <std::piecewise_construct+0x1>
 ab4:	48 89 c7             	mov    %rax,%rdi
 ab7:	e8 24 fd ff ff       	callq  7e0 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
 abc:	90                   	nop
 abd:	c9                   	leaveq 
 abe:	c3                   	retq   

0000000000000abf <input(int*)>:
 abf:	55                   	push   %rbp
 ac0:	48 89 e5             	mov    %rsp,%rbp
 ac3:	48 83 ec 10          	sub    $0x10,%rsp
 ac7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 acb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 acf:	48 89 c6             	mov    %rax,%rsi
 ad2:	48 8d 3d 67 16 20 00 	lea    0x201667(%rip),%rdi        # 202140 <std::cin@@GLIBCXX_3.4>
 ad9:	e8 e2 fc ff ff       	callq  7c0 <std::istream::operator>>(int&)@plt>
 ade:	90                   	nop
 adf:	c9                   	leaveq 
 ae0:	c3                   	retq   

0000000000000ae1 <__static_initialization_and_destruction_0(int, int)>:
 ae1:	55                   	push   %rbp
 ae2:	48 89 e5             	mov    %rsp,%rbp
 ae5:	48 83 ec 10          	sub    $0x10,%rsp
 ae9:	89 7d fc             	mov    %edi,-0x4(%rbp)
 aec:	89 75 f8             	mov    %esi,-0x8(%rbp)
 aef:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
 af3:	75 32                	jne    b27 <__static_initialization_and_destruction_0(int, int)+0x46>
 af5:	81 7d f8 ff ff 00 00 	cmpl   $0xffff,-0x8(%rbp)
 afc:	75 29                	jne    b27 <__static_initialization_and_destruction_0(int, int)+0x46>
 afe:	48 8d 3d 54 17 20 00 	lea    0x201754(%rip),%rdi        # 202259 <std::__ioinit>
 b05:	e8 f6 fc ff ff       	callq  800 <std::ios_base::Init::Init()@plt>
 b0a:	48 8d 15 f7 14 20 00 	lea    0x2014f7(%rip),%rdx        # 202008 <__dso_handle>
 b11:	48 8d 35 41 17 20 00 	lea    0x201741(%rip),%rsi        # 202259 <std::__ioinit>
 b18:	48 8b 05 d9 14 20 00 	mov    0x2014d9(%rip),%rax        # 201ff8 <std::ios_base::Init::~Init()@GLIBCXX_3.4>
 b1f:	48 89 c7             	mov    %rax,%rdi
 b22:	e8 a9 fc ff ff       	callq  7d0 <__cxa_atexit@plt>
 b27:	90                   	nop
 b28:	c9                   	leaveq 
 b29:	c3                   	retq   

0000000000000b2a <_GLOBAL__sub_I__Z6outmsgPKcPi>:
 b2a:	55                   	push   %rbp
 b2b:	48 89 e5             	mov    %rsp,%rbp
 b2e:	be ff ff 00 00       	mov    $0xffff,%esi
 b33:	bf 01 00 00 00       	mov    $0x1,%edi
 b38:	e8 a4 ff ff ff       	callq  ae1 <__static_initialization_and_destruction_0(int, int)>
 b3d:	5d                   	pop    %rbp
 b3e:	c3                   	retq   
 b3f:	90                   	nop

0000000000000b40 <__libc_csu_init>:
 b40:	41 57                	push   %r15
 b42:	41 56                	push   %r14
 b44:	49 89 d7             	mov    %rdx,%r15
 b47:	41 55                	push   %r13
 b49:	41 54                	push   %r12
 b4b:	4c 8d 25 1e 12 20 00 	lea    0x20121e(%rip),%r12        # 201d70 <__frame_dummy_init_array_entry>
 b52:	55                   	push   %rbp
 b53:	48 8d 2d 26 12 20 00 	lea    0x201226(%rip),%rbp        # 201d80 <__init_array_end>
 b5a:	53                   	push   %rbx
 b5b:	41 89 fd             	mov    %edi,%r13d
 b5e:	49 89 f6             	mov    %rsi,%r14
 b61:	4c 29 e5             	sub    %r12,%rbp
 b64:	48 83 ec 08          	sub    $0x8,%rsp
 b68:	48 c1 fd 03          	sar    $0x3,%rbp
 b6c:	e8 27 fc ff ff       	callq  798 <_init>
 b71:	48 85 ed             	test   %rbp,%rbp
 b74:	74 20                	je     b96 <__libc_csu_init+0x56>
 b76:	31 db                	xor    %ebx,%ebx
 b78:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 b7f:	00 
 b80:	4c 89 fa             	mov    %r15,%rdx
 b83:	4c 89 f6             	mov    %r14,%rsi
 b86:	44 89 ef             	mov    %r13d,%edi
 b89:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
 b8d:	48 83 c3 01          	add    $0x1,%rbx
 b91:	48 39 dd             	cmp    %rbx,%rbp
 b94:	75 ea                	jne    b80 <__libc_csu_init+0x40>
 b96:	48 83 c4 08          	add    $0x8,%rsp
 b9a:	5b                   	pop    %rbx
 b9b:	5d                   	pop    %rbp
 b9c:	41 5c                	pop    %r12
 b9e:	41 5d                	pop    %r13
 ba0:	41 5e                	pop    %r14
 ba2:	41 5f                	pop    %r15
 ba4:	c3                   	retq   
 ba5:	90                   	nop
 ba6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 bad:	00 00 00 

0000000000000bb0 <__libc_csu_fini>:
 bb0:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000000bb4 <_fini>:
 bb4:	48 83 ec 08          	sub    $0x8,%rsp
 bb8:	48 83 c4 08          	add    $0x8,%rsp
 bbc:	c3                   	retq   
