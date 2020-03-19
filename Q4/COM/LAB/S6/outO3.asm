
progO3:     file format elf64-x86-64


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
 930:	48 8d 3d 7d 04 00 00 	lea    0x47d(%rip),%rdi        # db4 <_IO_stdin_used+0x4>
 937:	48 83 ec 28          	sub    $0x28,%rsp
 93b:	31 f6                	xor    %esi,%esi
 93d:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
 944:	00 00 
 946:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
 94b:	31 c0                	xor    %eax,%eax
 94d:	e8 ee 02 00 00       	callq  c40 <outmsg(char const*, int*)>
 952:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
 957:	e8 c4 03 00 00       	callq  d20 <input(int*)>
 95c:	48 8d 3d 68 04 00 00 	lea    0x468(%rip),%rdi        # dcb <_IO_stdin_used+0x1b>
 963:	31 f6                	xor    %esi,%esi
 965:	e8 d6 02 00 00       	callq  c40 <outmsg(char const*, int*)>
 96a:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
 96f:	e8 ac 03 00 00       	callq  d20 <input(int*)>
 974:	48 8d 3d 68 04 00 00 	lea    0x468(%rip),%rdi        # de3 <_IO_stdin_used+0x33>
 97b:	31 f6                	xor    %esi,%esi
 97d:	e8 be 02 00 00       	callq  c40 <outmsg(char const*, int*)>
 982:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
 987:	e8 94 03 00 00       	callq  d20 <input(int*)>
 98c:	8b 54 24 10          	mov    0x10(%rsp),%edx
 990:	8b 74 24 0c          	mov    0xc(%rsp),%esi
 994:	8b 7c 24 08          	mov    0x8(%rsp),%edi
 998:	e8 73 01 00 00       	callq  b10 <mathloop(int, int, int)>
 99d:	48 8d 74 24 14       	lea    0x14(%rsp),%rsi
 9a2:	48 8d 3d 51 04 00 00 	lea    0x451(%rip),%rdi        # dfa <_IO_stdin_used+0x4a>
 9a9:	89 44 24 14          	mov    %eax,0x14(%rsp)
 9ad:	e8 8e 02 00 00       	callq  c40 <outmsg(char const*, int*)>
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
 a0f:	4c 8d 05 8a 03 00 00 	lea    0x38a(%rip),%r8        # da0 <__libc_csu_fini>
 a16:	48 8d 0d 13 03 00 00 	lea    0x313(%rip),%rcx        # d30 <__libc_csu_init>
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
 b10:	85 ff                	test   %edi,%edi
 b12:	0f 8e 24 01 00 00    	jle    c3c <mathloop(int, int, int)+0x12c>
 b18:	41 54                	push   %r12
 b1a:	41 89 d1             	mov    %edx,%r9d
 b1d:	55                   	push   %rbp
 b1e:	44 8d 62 ff          	lea    -0x1(%rdx),%r12d
 b22:	89 d5                	mov    %edx,%ebp
 b24:	53                   	push   %rbx
 b25:	66 0f 6f 2d e3 02 00 	movdqa 0x2e3(%rip),%xmm5        # e10 <_IO_stdin_used+0x60>
 b2c:	00 
 b2d:	41 c1 e9 02          	shr    $0x2,%r9d
 b31:	83 e5 fc             	and    $0xfffffffc,%ebp
 b34:	31 c0                	xor    %eax,%eax
 b36:	31 db                	xor    %ebx,%ebx
 b38:	66 0f 6f 25 e0 02 00 	movdqa 0x2e0(%rip),%xmm4        # e20 <_IO_stdin_used+0x70>
 b3f:	00 
 b40:	85 f6                	test   %esi,%esi
 b42:	0f 8e d9 00 00 00    	jle    c21 <mathloop(int, int, int)+0x111>
 b48:	45 31 c0             	xor    %r8d,%r8d
 b4b:	45 31 d2             	xor    %r10d,%r10d
 b4e:	66 90                	xchg   %ax,%ax
 b50:	85 d2                	test   %edx,%edx
 b52:	0f 8e b9 00 00 00    	jle    c11 <mathloop(int, int, int)+0x101>
 b58:	41 83 fc 05          	cmp    $0x5,%r12d
 b5c:	0f 86 d6 00 00 00    	jbe    c38 <mathloop(int, int, int)+0x128>
 b62:	44 89 44 24 fc       	mov    %r8d,-0x4(%rsp)
 b67:	66 0f ef c0          	pxor   %xmm0,%xmm0
 b6b:	66 0f 6e 74 24 fc    	movd   -0x4(%rsp),%xmm6
 b71:	66 0f 6f cd          	movdqa %xmm5,%xmm1
 b75:	31 c9                	xor    %ecx,%ecx
 b77:	66 0f 70 de 00       	pshufd $0x0,%xmm6,%xmm3
 b7c:	0f 1f 40 00          	nopl   0x0(%rax)
 b80:	66 0f 6f d1          	movdqa %xmm1,%xmm2
 b84:	83 c1 01             	add    $0x1,%ecx
 b87:	66 0f fe cc          	paddd  %xmm4,%xmm1
 b8b:	44 39 c9             	cmp    %r9d,%ecx
 b8e:	66 0f fe d3          	paddd  %xmm3,%xmm2
 b92:	66 0f fe c2          	paddd  %xmm2,%xmm0
 b96:	72 e8                	jb     b80 <mathloop(int, int, int)+0x70>
 b98:	66 0f 6f c8          	movdqa %xmm0,%xmm1
 b9c:	66 0f 73 d9 08       	psrldq $0x8,%xmm1
 ba1:	66 0f fe c1          	paddd  %xmm1,%xmm0
 ba5:	66 0f 6f c8          	movdqa %xmm0,%xmm1
 ba9:	66 0f 73 d9 04       	psrldq $0x4,%xmm1
 bae:	66 0f fe c1          	paddd  %xmm1,%xmm0
 bb2:	66 0f 7e c1          	movd   %xmm0,%ecx
 bb6:	01 c8                	add    %ecx,%eax
 bb8:	39 ea                	cmp    %ebp,%edx
 bba:	89 e9                	mov    %ebp,%ecx
 bbc:	74 53                	je     c11 <mathloop(int, int, int)+0x101>
 bbe:	45 8d 1c 08          	lea    (%r8,%rcx,1),%r11d
 bc2:	44 01 d8             	add    %r11d,%eax
 bc5:	44 8d 59 01          	lea    0x1(%rcx),%r11d
 bc9:	41 39 d3             	cmp    %edx,%r11d
 bcc:	7d 43                	jge    c11 <mathloop(int, int, int)+0x101>
 bce:	45 01 c3             	add    %r8d,%r11d
 bd1:	44 01 d8             	add    %r11d,%eax
 bd4:	44 8d 59 02          	lea    0x2(%rcx),%r11d
 bd8:	44 39 da             	cmp    %r11d,%edx
 bdb:	7e 34                	jle    c11 <mathloop(int, int, int)+0x101>
 bdd:	45 01 c3             	add    %r8d,%r11d
 be0:	44 01 d8             	add    %r11d,%eax
 be3:	44 8d 59 03          	lea    0x3(%rcx),%r11d
 be7:	44 39 da             	cmp    %r11d,%edx
 bea:	7e 25                	jle    c11 <mathloop(int, int, int)+0x101>
 bec:	45 01 c3             	add    %r8d,%r11d
 bef:	44 01 d8             	add    %r11d,%eax
 bf2:	44 8d 59 04          	lea    0x4(%rcx),%r11d
 bf6:	44 39 da             	cmp    %r11d,%edx
 bf9:	7e 16                	jle    c11 <mathloop(int, int, int)+0x101>
 bfb:	45 01 c3             	add    %r8d,%r11d
 bfe:	83 c1 05             	add    $0x5,%ecx
 c01:	44 01 d8             	add    %r11d,%eax
 c04:	45 8d 1c 08          	lea    (%r8,%rcx,1),%r11d
 c08:	41 01 c3             	add    %eax,%r11d
 c0b:	39 ca                	cmp    %ecx,%edx
 c0d:	41 0f 4f c3          	cmovg  %r11d,%eax
 c11:	41 83 c2 01          	add    $0x1,%r10d
 c15:	41 01 d8             	add    %ebx,%r8d
 c18:	44 39 d6             	cmp    %r10d,%esi
 c1b:	0f 85 2f ff ff ff    	jne    b50 <mathloop(int, int, int)+0x40>
 c21:	83 c3 01             	add    $0x1,%ebx
 c24:	39 df                	cmp    %ebx,%edi
 c26:	0f 85 14 ff ff ff    	jne    b40 <mathloop(int, int, int)+0x30>
 c2c:	5b                   	pop    %rbx
 c2d:	5d                   	pop    %rbp
 c2e:	41 5c                	pop    %r12
 c30:	c3                   	retq   
 c31:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
 c38:	31 c9                	xor    %ecx,%ecx
 c3a:	eb 82                	jmp    bbe <mathloop(int, int, int)+0xae>
 c3c:	31 c0                	xor    %eax,%eax
 c3e:	c3                   	retq   
 c3f:	90                   	nop

0000000000000c40 <outmsg(char const*, int*)>:
 c40:	55                   	push   %rbp
 c41:	53                   	push   %rbx
 c42:	48 89 fb             	mov    %rdi,%rbx
 c45:	48 83 ec 08          	sub    $0x8,%rsp
 c49:	48 85 f6             	test   %rsi,%rsi
 c4c:	74 52                	je     ca0 <outmsg(char const*, int*)+0x60>
 c4e:	48 85 ff             	test   %rdi,%rdi
 c51:	48 89 f5             	mov    %rsi,%rbp
 c54:	0f 84 96 00 00 00    	je     cf0 <outmsg(char const*, int*)+0xb0>
 c5a:	e8 41 fc ff ff       	callq  8a0 <strlen@plt>
 c5f:	48 8d 3d ba 13 20 00 	lea    0x2013ba(%rip),%rdi        # 202020 <std::cout@@GLIBCXX_3.4>
 c66:	48 89 c2             	mov    %rax,%rdx
 c69:	48 89 de             	mov    %rbx,%rsi
 c6c:	e8 6f fc ff ff       	callq  8e0 <std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@plt>
 c71:	8b 75 00             	mov    0x0(%rbp),%esi
 c74:	48 8d 3d a5 13 20 00 	lea    0x2013a5(%rip),%rdi        # 202020 <std::cout@@GLIBCXX_3.4>
 c7b:	e8 90 fc ff ff       	callq  910 <std::ostream::operator<<(int)@plt>
 c80:	48 83 c4 08          	add    $0x8,%rsp
 c84:	48 8d 35 56 01 00 00 	lea    0x156(%rip),%rsi        # de1 <_IO_stdin_used+0x31>
 c8b:	ba 01 00 00 00       	mov    $0x1,%edx
 c90:	5b                   	pop    %rbx
 c91:	5d                   	pop    %rbp
 c92:	48 89 c7             	mov    %rax,%rdi
 c95:	e9 46 fc ff ff       	jmpq   8e0 <std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@plt>
 c9a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
 ca0:	48 85 ff             	test   %rdi,%rdi
 ca3:	74 23                	je     cc8 <outmsg(char const*, int*)+0x88>
 ca5:	e8 f6 fb ff ff       	callq  8a0 <strlen@plt>
 caa:	48 83 c4 08          	add    $0x8,%rsp
 cae:	48 89 de             	mov    %rbx,%rsi
 cb1:	48 8d 3d 68 13 20 00 	lea    0x201368(%rip),%rdi        # 202020 <std::cout@@GLIBCXX_3.4>
 cb8:	5b                   	pop    %rbx
 cb9:	5d                   	pop    %rbp
 cba:	48 89 c2             	mov    %rax,%rdx
 cbd:	e9 1e fc ff ff       	jmpq   8e0 <std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long)@plt>
 cc2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
 cc8:	48 8b 05 51 13 20 00 	mov    0x201351(%rip),%rax        # 202020 <std::cout@@GLIBCXX_3.4>
 ccf:	48 8d 3d 4a 13 20 00 	lea    0x20134a(%rip),%rdi        # 202020 <std::cout@@GLIBCXX_3.4>
 cd6:	48 03 78 e8          	add    -0x18(%rax),%rdi
 cda:	8b 77 20             	mov    0x20(%rdi),%esi
 cdd:	48 83 c4 08          	add    $0x8,%rsp
 ce1:	5b                   	pop    %rbx
 ce2:	5d                   	pop    %rbp
 ce3:	83 ce 01             	or     $0x1,%esi
 ce6:	e9 15 fc ff ff       	jmpq   900 <std::basic_ios<char, std::char_traits<char> >::clear(std::_Ios_Iostate)@plt>
 ceb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 cf0:	48 8b 05 29 13 20 00 	mov    0x201329(%rip),%rax        # 202020 <std::cout@@GLIBCXX_3.4>
 cf7:	48 8d 3d 22 13 20 00 	lea    0x201322(%rip),%rdi        # 202020 <std::cout@@GLIBCXX_3.4>
 cfe:	48 03 78 e8          	add    -0x18(%rax),%rdi
 d02:	8b 77 20             	mov    0x20(%rdi),%esi
 d05:	83 ce 01             	or     $0x1,%esi
 d08:	e8 f3 fb ff ff       	callq  900 <std::basic_ios<char, std::char_traits<char> >::clear(std::_Ios_Iostate)@plt>
 d0d:	e9 5f ff ff ff       	jmpq   c71 <outmsg(char const*, int*)+0x31>
 d12:	0f 1f 40 00          	nopl   0x0(%rax)
 d16:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 d1d:	00 00 00 

0000000000000d20 <input(int*)>:
 d20:	48 89 fe             	mov    %rdi,%rsi
 d23:	48 8d 3d 16 14 20 00 	lea    0x201416(%rip),%rdi        # 202140 <std::cin@@GLIBCXX_3.4>
 d2a:	e9 81 fb ff ff       	jmpq   8b0 <std::istream::operator>>(int&)@plt>
 d2f:	90                   	nop

0000000000000d30 <__libc_csu_init>:
 d30:	41 57                	push   %r15
 d32:	41 56                	push   %r14
 d34:	49 89 d7             	mov    %rdx,%r15
 d37:	41 55                	push   %r13
 d39:	41 54                	push   %r12
 d3b:	4c 8d 25 1e 10 20 00 	lea    0x20101e(%rip),%r12        # 201d60 <__frame_dummy_init_array_entry>
 d42:	55                   	push   %rbp
 d43:	48 8d 2d 26 10 20 00 	lea    0x201026(%rip),%rbp        # 201d70 <__init_array_end>
 d4a:	53                   	push   %rbx
 d4b:	41 89 fd             	mov    %edi,%r13d
 d4e:	49 89 f6             	mov    %rsi,%r14
 d51:	4c 29 e5             	sub    %r12,%rbp
 d54:	48 83 ec 08          	sub    $0x8,%rsp
 d58:	48 c1 fd 03          	sar    $0x3,%rbp
 d5c:	e8 17 fb ff ff       	callq  878 <_init>
 d61:	48 85 ed             	test   %rbp,%rbp
 d64:	74 20                	je     d86 <__libc_csu_init+0x56>
 d66:	31 db                	xor    %ebx,%ebx
 d68:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 d6f:	00 
 d70:	4c 89 fa             	mov    %r15,%rdx
 d73:	4c 89 f6             	mov    %r14,%rsi
 d76:	44 89 ef             	mov    %r13d,%edi
 d79:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
 d7d:	48 83 c3 01          	add    $0x1,%rbx
 d81:	48 39 dd             	cmp    %rbx,%rbp
 d84:	75 ea                	jne    d70 <__libc_csu_init+0x40>
 d86:	48 83 c4 08          	add    $0x8,%rsp
 d8a:	5b                   	pop    %rbx
 d8b:	5d                   	pop    %rbp
 d8c:	41 5c                	pop    %r12
 d8e:	41 5d                	pop    %r13
 d90:	41 5e                	pop    %r14
 d92:	41 5f                	pop    %r15
 d94:	c3                   	retq   
 d95:	90                   	nop
 d96:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 d9d:	00 00 00 

0000000000000da0 <__libc_csu_fini>:
 da0:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000000da4 <_fini>:
 da4:	48 83 ec 08          	sub    $0x8,%rsp
 da8:	48 83 c4 08          	add    $0x8,%rsp
 dac:	c3                   	retq   
