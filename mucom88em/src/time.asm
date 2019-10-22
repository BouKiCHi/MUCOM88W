;==========================================================================
; MUCOM88 Extended Memory Edition (MUCOM88em)
; �t�@�C���� : time.asm (Z80�A�Z���u���\�[�X)
; �@�\ : �e�L�X�g�I���`�F�b�N���^�C���\��
; �X�V���F2019/10/22
;==========================================================================
; ���{�\�[�X��MUSICLALF Ver.1.0�`1.2���ʂ�time.asm�Ɠ����ł��B
;==========================================================================
	
	
	;TXTEND CHECK & TIME PRINT
	
	ORG	0E400H
	
NOTSB2:	EQU	0FFF8H
TXTEND:	EQU	0EB18H
S.ILVL:	EQU	0E6C3H
TIME:	EQU	0B000H+3*17
	
	
; --	BASIC � TEXTEND���� � vrtc�غ� � ��ò	--
	
STTE:
	LD	HL,(0F302H)
	LD	(CHJ+1),HL
	DI
	LD	HL,CHECK
	LD	(0F302H),HL
	EI
	RET
	
; --	CHECK ٰ��(8D00H� �ݿ����)	--
	
CHECK:
	DI
	PUSH	AF
	PUSH	HL
	PUSH	DE
	PUSH	BC
	
	LD	HL,VRTCC
	DEC	(HL)
	JR	NZ,CH3
	LD	(HL),6
	
CH2:
	CALL	TIME
CH3:
	LD	A,(S.ILVL)
	OUT	(0E4H),A
	
	POP	BC
	POP	DE
	POP	HL
	POP	AF
	EI
CHJ:
	JP	0E808H
	
VRTCC:	DB	30
