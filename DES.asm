IDEAL
MODEL small
STACK 100h
p186
DATASEG
; --------------------------
; Your variables here
empty db 16 dup(00)
; ------------------------------- INPUTS -------------------------------
input_data db 9, 0, 8 dup(00), 13, 10, '$'
input_key db 9, 0, 8 dup(00), 13, 10, '$'
input_key_2 db 9, 0, 8 dup(00), 13, 10, '$'
temp_key db 9, 0, 8 dup(00), 13, 10, '$'
input_Encrypted_data db 17, 0, 16 dup(00), 13, 10, '$'
; ------------------------------- KEY AFTER PERMUTE PC1 + LEFT HALF & RIGHT HALF -------------------------------
cd db "pc1"
pc1_key db 7 dup(00), '$'
c0 db "C0"
C_0 db 4 dup(00), '$'
d0 db "D0"
D_0 db 4 dup(00), '$'
; ------------------------------- TEMPORARY SAVE OF SHIFTED BITS -------------------------------
shift_keys_left_byte db 0
shift_keys_second_left_byte db 0
shift_keys_second_right_byte db 0
shift_keys_right_byte db 0
; ------------------------------- C (LEFT HALF) 16 KEYS AFTER SHIFTS -------------------------------
c1 db "C1"
C_1 db 4 dup(00), '$'
C_2 db 4 dup(00), '$'
C_3 db 4 dup(00), '$'
C_4 db 4 dup(00), '$'
C_5 db 4 dup(00), '$'
C_6 db 4 dup(00), '$'
C_7 db 4 dup(00), '$'
C_8 db 4 dup(00), '$'
C_9 db 4 dup(00), '$'
C_10 db 4 dup(00), '$'
C_11 db 4 dup(00), '$'
C_12 db 4 dup(00), '$'
C_13 db 4 dup(00), '$'
C_14 db 4 dup(00), '$'
C_15 db 4 dup(00), '$'
C_16 db 4 dup(00), '$'
; ------------------------------- D (RIGHT HALF) 16 KEYS AFTER SHIFTS -------------------------------
d1 db "D1"
D_1 db 4 dup(00), '$'
D_2 db 4 dup(00), '$'
D_3 db 4 dup(00), '$'
D_4 db 4 dup(00), '$'
D_5 db 4 dup(00), '$'
D_6 db 4 dup(00), '$'
D_7 db 4 dup(00), '$'
D_8 db 4 dup(00), '$'
D_9 db 4 dup(00), '$'
D_10 db 4 dup(00), '$'
D_11 db 4 dup(00), '$'
D_12 db 4 dup(00), '$'
D_13 db 4 dup(00), '$'
D_14 db 4 dup(00), '$'
D_15 db 4 dup(00), '$'
D_16 db 4 dup(00), '$'
; ------------------------------- C $ D COMBINED, 16 KEYS -------------------------------
cd1 db "CD1"
C_D_1 db 0, 0, 8 dup(00), '$'
C_D_2 db 0, 0, 8 dup(00), '$'
C_D_3 db 0, 0, 8 dup(00), '$'
C_D_4 db 0, 0, 8 dup(00), '$'
C_D_5 db 0, 0, 8 dup(00), '$'
C_D_6 db 0, 0, 8 dup(00), '$'
C_D_7 db 0, 0, 8 dup(00), '$'
C_D_8 db 0, 0, 8 dup(00), '$'
C_D_9 db 0, 0, 8 dup(00), '$'
C_D_10 db 0, 0, 8 dup(00), '$'
C_D_11 db 0, 0, 8 dup(00), '$'
C_D_12 db 0, 0, 8 dup(00), '$'
C_D_13 db 0, 0, 8 dup(00), '$'
C_D_14 db 0, 0, 8 dup(00), '$'
C_D_15 db 0, 0, 8 dup(00), '$'
C_D_16 db 0, 0, 8 dup(00), '$'
; ------------------------------- K 16 KEYS AFTER PERMUTE PC2 (MADE FROM C & D COMBINED) -------------------------------
k1 db 'K1'
K_1 db 6 dup(00), '$'
k2 db 'K2'
K_2 db 6 dup(00), '$'
k3 db 'K3'
K_3 db 6 dup(00), '$'
k4 db 'K4'
K_4 db 6 dup(00), '$'
k5 db 'K5'
K_5 db 6 dup(00), '$'
k6 db 'K6'
K_6 db 6 dup(00), '$'
k7 db 'K7'
K_7 db 6 dup(00), '$'
k8 db 'K8'
K_8 db 6 dup(00), '$'
k9 db 'K9'
K_9 db 6 dup(00), '$'
k10 db 'K10'
K_10 db 6 dup(00), '$'
k11 db 'K11'
K_11 db 6 dup(00), '$'
k12 db 'K12'
K_12 db 6 dup(00), '$'
k13 db 'K13'
K_13 db 6 dup(00), '$'
k14 db 'K14'
K_14 db 6 dup(00), '$'
k15 db 'K15'
K_15 db 6 dup(00), '$'
k16 db 'K16'
K_16 db 6 dup(00), '$'
; ------------------------------- INPUTED DATA AFTER INITIAL PERMUTATION & LEFT PART & RIGHT PART -------------------------------
IP_data db 8 dup(00), '$'
L_0 db 4 dup(00), '$'
R_0 db 4 dup(00), '$'
; ------------------------------- 16 left and 16 right data parts and all the necessary thing to make them -------------------------------
L_1 db 4 dup(00), '$'
L_1_00 db 0, 0, 4 dup(00), '$'
E_R_0 db 6 dup(00), '$'
S_1 db 4 dup(00), '$'
S_1_00 db 0, 0, 4 dup(00), '$'
r1 db "R1"
R_1 db 4 dup(00), '$'
L_2 db 4 dup(00), '$'
L_2_00 db 0, 0, 4 dup(00), '$'
E_R_1 db 6 dup(00), '$'
S_2 db 4 dup(00), '$'
S_2_00 db 0, 0, 4 dup(00), '$'
r2 db "R2"
R_2 db 4 dup(00), '$'
L_3 db 4 dup(00), '$'
L_3_00 db 0, 0, 4 dup(00), '$'
E_R_2 db 6 dup(00), '$'
S_3 db 4 dup(00), '$'
S_3_00 db 0, 0, 4 dup(00), '$'
r3 db "R3"
R_3 db 4 dup(00), '$'
L_4 db 4 dup(00), '$'
L_4_00 db 0, 0, 4 dup(00), '$'
E_R_3 db 6 dup(00), '$'
S_4 db 4 dup(00), '$'
S_4_00 db 0, 0, 4 dup(00), '$'
r4 db "R4"
R_4 db 4 dup(00), '$'
L_5 db 4 dup(00), '$'
L_5_00 db 0, 0, 4 dup(00), '$'
E_R_4 db 6 dup(00), '$'
S_5 db 4 dup(00), '$'
S_5_00 db 0, 0, 4 dup(00), '$'
r5 db "R5"
R_5 db 4 dup(00), '$'
L_6 db 4 dup(00), '$'
L_6_00 db 0, 0, 4 dup(00), '$'
E_R_5 db 6 dup(00), '$'
S_6 db 4 dup(00), '$'
S_6_00 db 0, 0, 4 dup(00), '$'
r6 db "R6"
R_6 db 4 dup(00), '$'
L_7 db 4 dup(00), '$'
L_7_00 db 0, 0, 4 dup(00), '$'
E_R_6 db 6 dup(00), '$'
S_7 db 4 dup(00), '$'
S_7_00 db 0, 0, 4 dup(00), '$'
r7 db "R7"
R_7 db 4 dup(00), '$'
L_8 db 4 dup(00), '$'
L_8_00 db 0, 0, 4 dup(00), '$'
E_R_7 db 6 dup(00), '$'
S_8 db 4 dup(00), '$'
S_8_00 db 0, 0, 4 dup(00), '$'
r8 db "R8"
R_8 db 4 dup(00), '$'
L_9 db 4 dup(00), '$'
L_9_00 db 0, 0, 4 dup(00), '$'
E_R_8 db 6 dup(00), '$'
S_9 db 4 dup(00), '$'
S_9_00 db 0, 0, 4 dup(00), '$'
r9 db "R9"
R_9 db 4 dup(00), '$'
L_10 db 4 dup(00), '$'
L_10_00 db 0, 0, 4 dup(00), '$'
E_R_9 db 6 dup(00), '$'
S_10 db 4 dup(00), '$'
S_10_00 db 0, 0, 4 dup(00), '$'
r10 db "R10"
R_10 db 4 dup(00), '$'
L_11 db 4 dup(00), '$'
L_11_00 db 0, 0, 4 dup(00), '$'
E_R_10 db 6 dup(00), '$'
S_11 db 4 dup(00), '$'
S_11_00 db 0, 0, 4 dup(00), '$'
r11 db "R11"
R_11 db 4 dup(00), '$'
L_12 db 4 dup(00), '$'
L_12_00 db 0, 0, 4 dup(00), '$'
E_R_11 db 6 dup(00), '$'
S_12 db 4 dup(00), '$'
S_12_00 db 0, 0, 4 dup(00), '$'
r12 db "R12"
R_12 db 4 dup(00), '$'
L_13 db 4 dup(00), '$'
L_13_00 db 0, 0, 4 dup(00), '$'
E_R_12 db 6 dup(00), '$'
S_13 db 4 dup(00), '$'
S_13_00 db 0, 0, 4 dup(00), '$'
r13 db "R13"
R_13 db 4 dup(00), '$'
L_14 db 4 dup(00), '$'
L_14_00 db 0, 0, 4 dup(00), '$'
E_R_13 db 6 dup(00), '$'
S_14 db 4 dup(00), '$'
S_14_00 db 0, 0, 4 dup(00), '$'
r14 db "R14"
R_14 db 4 dup(00), '$'
L_15 db 4 dup(00), '$'
L_15_00 db 0, 0, 4 dup(00), '$'
E_R_14 db 6 dup(00), '$'
S_15 db 4 dup(00), '$'
S_15_00 db 0, 0, 4 dup(00), '$'
r15 db "R15"
R_15 db 4 dup(00), '$'
L_16_00 db 0, 0, 4 dup(00), '$'
E_R_15 db 6 dup(00), '$'
S_16 db 4 dup(00), '$'
S_16_00 db 0, 0, 4 dup(00), '$'
L_16 db 4 dup(00), '$'
r16 db "R16"
R_16 db 4 dup(00), '$'
r16l16 db "R16_L16"
R16_L16 db 8 dup(00), '$'
msg_Encrypted_Data db "Encrypted-Data"
Encrypted_Data db 8 dup(00), '$'
msg_Decrypted_Data db "Decrypted-Data"
Decrypted_Data db 8 dup(00), '$'
; ------------------------------- PC1 & PC2 & IP & E_TABLE & S_BOXES (1 to 8) & P & IP_1 -------------------------------
PC1 db 57, 49, 41, 33, 25, 17, 9, 1, 58, 50, 42, 34, 26, 18, 10, 2, 59, 51, 43, 35, 27, 19, 11, 3, 60, 52, 44, 36, 63, 55, 47, 39, 31, 23, 15, 7, 62, 54, 46, 38, 30, 22, 14, 6, 61, 53, 45, 37, 29, 21, 13, 5, 28, 20, 12, 4
PC2 db 14, 17, 11, 24, 1, 5, 3, 28, 15, 6, 21, 10, 23, 19, 12, 4, 26, 8, 16, 7, 27, 20, 13, 2, 41, 52, 31, 37, 47, 55, 30, 40, 51, 45, 33, 48, 44, 49, 39, 56, 34, 53, 46, 42, 50, 36, 29, 32
IP db 58, 50, 42, 34, 26, 18, 10, 2, 60, 52, 44, 36, 28, 20, 12, 4, 62, 54, 46, 38, 30, 22, 14, 6, 64, 56, 48, 40, 32, 24, 16, 8, 57, 49, 41, 33, 25, 17, 9, 1, 59, 51, 43, 35, 27, 19, 11, 3, 61, 53, 45, 37, 29, 21, 13, 5, 63, 55, 47, 39, 31, 23, 15, 7
E_TABLE db 32, 1, 2, 3, 4, 5, 4, 5, 6, 7, 8, 9, 8, 9, 10, 11, 12, 13, 12, 13, 14, 15, 16, 17, 16, 17, 18, 19, 20, 21, 20, 21, 22, 23, 24, 25, 24, 25, 26, 27, 28, 29, 28, 29, 30, 31, 32, 1
S_Box1 db 14, 4, 13, 1, 2, 15, 11, 8, 3, 10, 6, 12, 5, 9, 0, 7, 0, 15, 7, 4, 14, 2, 13, 1, 10, 6, 12, 11, 9, 5, 3, 8, 4, 1, 14, 8, 13, 6, 2, 11, 15, 12, 9, 7, 3, 10, 5, 0, 15, 12, 8, 2, 4, 9, 1, 7, 5, 11, 3, 14, 10, 0, 6, 13
S_Box2 db 15, 1, 8, 14, 6, 11, 3, 4, 9, 7, 2, 13, 12, 0, 5, 10, 3, 13, 4, 7, 15, 2, 8, 14, 12, 0, 1, 10, 6, 9, 11, 5, 0, 14, 7, 11, 10, 4, 13, 1, 5, 8, 12, 6, 9, 3, 2, 15, 13, 8, 10, 1, 3, 15, 4, 2, 11, 6, 7, 12, 0, 5, 14, 9
S_Box3 db 10, 0, 9, 14, 6, 3, 15, 5, 1, 13, 12, 7, 11, 4, 2, 8, 13, 7, 0, 9, 3, 4, 6, 10, 2, 8, 5, 14, 12, 11, 15, 1, 13, 6, 4, 9, 8, 15, 3, 0, 11, 1, 2, 12, 5,10, 14, 7, 1, 10, 13, 0, 6, 9, 8, 7, 4, 15, 14, 3, 11, 5, 2, 12
S_Box4 db 7, 13, 14, 3, 0, 6, 9, 10, 1, 2, 8, 5, 11, 12, 4, 15, 13, 8, 11, 5, 6, 15, 0, 3, 4, 7, 2, 12, 1, 10, 14, 9, 10, 6, 9, 0, 12, 11, 7, 13, 15, 1, 3, 14, 5, 2, 8, 4, 3, 15, 0, 6, 10, 1, 13, 8, 9, 4, 5, 11, 12, 7, 2, 14
S_Box5 db 2, 12, 4, 1, 7, 10, 11, 6, 8, 5, 3, 15, 13, 0, 14, 9, 14, 11, 2, 12, 4, 7, 13, 1, 5, 0, 15, 10, 3, 9, 8, 6, 4, 2, 1, 11, 10, 13, 7, 8, 15, 9, 12, 5, 6, 3, 0, 14, 11, 8, 12, 7, 1, 14, 2, 13, 6, 15, 0, 9, 10, 4, 5, 3
S_Box6 db 12, 1, 10, 15, 9, 2, 6, 8, 0, 13, 3, 4, 14, 7, 5, 11, 10, 15, 4, 2, 7, 12, 9, 5, 6, 1, 13, 14, 0, 11, 3, 8, 9, 14, 15, 5, 2, 8, 12, 3, 7, 0, 4, 10, 1, 13, 11, 6, 4, 3, 2, 12, 9, 5, 15, 10, 11, 14, 1, 7, 6, 0, 8, 13
S_Box7 db 4, 11, 2, 14, 15, 0, 8, 13, 3, 12, 9, 7, 5, 10, 6, 1, 13, 0, 11, 7, 4, 9, 1, 10, 14, 3, 5, 12, 2, 15, 8, 6, 1, 4, 11, 13, 12, 3, 7, 14, 10, 15, 6, 8, 0, 5, 9, 2, 6, 11, 13, 8, 1, 4, 10, 7, 9, 5, 0, 15, 14, 2, 3, 12
S_Box8 db 13, 2, 8, 4, 6, 15, 11, 1, 10, 9, 3, 14, 5, 0, 12, 7, 1, 15, 13, 8, 10, 3, 7, 4, 12, 5, 6, 11, 0, 14, 9, 2, 7, 11, 4, 1, 9, 12, 14, 2, 0, 6, 10, 13, 15, 3, 5, 8, 2, 1, 14, 7, 4, 10, 8, 13, 15, 12, 9, 0, 3, 5, 6, 11
P_AFTER_SBOXES db 16, 7, 20, 21, 29, 12, 28, 17, 1, 15, 23, 26, 5, 18, 31, 10, 2, 8, 24, 14, 32, 27, 3, 9, 19, 13, 30, 6, 22, 11, 4, 25
IP_1 db 40, 8, 48, 16, 56, 24, 64, 32, 39, 7, 47, 15, 55, 23, 63, 31, 38, 6,  46, 14, 54, 22, 62, 30, 37, 5, 45, 13, 53, 21, 61, 29, 36, 4, 44, 12, 52, 20, 60, 28, 35, 3, 43, 11, 51, 19, 59, 27, 34, 2, 42, 10, 50, 18, 58, 26, 33, 1, 41, 9, 49, 17, 57, 25
; ------------------------------- MESSAGES TO PRINT -------------------------------
msg_mode db "enter your desired mode !!! DES Encryption - 1E, DES Decryption - 1D, DES3 Encryption - 3E, DES3 Decryption - 3D !!!", 13, 10, '$'
msg1 db "enter data (8 chars):", 13, 10, '$'
msg2 db "enter your key (8 chars):", 13, 10, '$'
msg1_Decryption db "enter encrypted data !! IN HEX !!", 13, 10, '$'
msg2_Decryption db "enter the encrypted data - key:", 13, 10, '$'
msg_DES3 db "enter data (8 chars):", 13, 10, '$'
msg_DES3_Decryption db "enter encrypted data !! IN HEX !!", 13, 10, '$'
msg2_DES3_Decryption db "enter the encrypted data - key 1", 13, 10, '$'
msg3_DES3_Decryption db "enter the encrypted data - key 2", 13, 10, '$'
msg_DES3_K1 db "enter your first key (8 chars):", 13, 10, '$'
msg_DES3_K2 db "enter your second key (8 chars):", 13, 10, '$'
finish_msg db "Encrypted Data:", 13, 10, '$'
finish_msg_Decryption db "Decrypted data:", 13, 10, '$'
msg_Invalid db "you entered an invalid mode please enter a valid mode", 13, 10, '$'
blank db 13, 10, '$'
dollar db '$'
between_prints db 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 000h, 0C4h, 0C4h, '$'
; ------------------------------- COUNTERS -------------------------------
counter dw 0
; --------------------------
what_to_do db 3, 0, 2 dup(00), 13, 10, '$'
CODESEG
; --------------------------------------------- PERMUTATION ---------------------------------------------
; 1) push the data offset you want to perform the permutation on
; 2) push permutation table offset
; 3) push the data output offset
; 4) push the lengh of the permutation table (how many bits you are performing on)
; --------------------------------------------- PERMUTATION ---------------------------------------------
proc permutation
	push bp
	mov bp, sp
	pusha
; loop to perform the permutation (the number of times that is received through the stack)
	mov cx, [word ptr bp + 4]
permutation_loop:
	mov di, [word ptr bp + 4]
	sub di, cx
	xor ax, ax
; takes a value from the pushed permutation table offset
	mov bx, [word ptr bp + 8]
	mov al, [byte ptr bx + di]
; מחלקים בשביל לקבל באיזה מ8 הבתים נמצא הביט שצריך וכמה שיפטים צריך לעשות כדי לקבל את הביט המסויים
	mov bx, 8
	div bl
	xor bx, bx
	cmp ah, 0
	jne permutation_p1_not_zero
	dec al
	mov ah, 8
	mov bl, al
	add bl, 2
	mov di, bx
	jmp permutation_p1_zero
permutation_p1_not_zero:
; מקבלים את הבית שבו נמצא הביט שאנו צריכים ומחלצים את הביט לתוך הקארי פלאג
	mov bl, al
	add bl, 2
	mov di, bx
permutation_p1_zero:
	push cx
	xor cx, cx
	mov bx, [word ptr bp + 10]
	mov ch, [byte ptr bx + di]
	xor bx, bx
	mov bh, ch
	pop cx
	cmp bh, 0
	je permutation_end
	push cx
	xor cx, cx
	mov cl, ah
	xor dx, dx
; משתמשים בחלוקה ממקודם ועושים שיפט שארית פעמים
	shl bx, cl
	rcl dx, 1
	pop cx
	cmp dl, 0
	je permutation_end
	mov ax, [word ptr bp + 4]
	inc ax
	sub ax, cx
	mov bx, 8
	div bl
; אם אין שארית רנו רוצים לחזור בית אחד אחורה ממה שרשום במנה
	cmp ah, 0
	jne permutation_p2_not_zero
	dec al
	jmp permutation_p2_zero
; המיקום של הביט שקיבלנו הוא משמאל לימין ואנחנו צריכים מימין לשמאל אז עושים 8 פחות מה שקיבלנו
; בנוסף אם המיקום של הביט שקיבלנו שווה ל0 אז אנחנו לא רוצים לעשות את מה שרשום שורה מעל זה
permutation_p2_not_zero:
	push cx
	mov cl, 8
	sub cl, ah
	jmp permutation_p2
permutation_p2_zero:
	push cx
	mov cl, ah
permutation_p2:
	shl dx, cl
	xor bx, bx
	mov bl, al
	mov di, bx
; I have set the byte to start with 00 so we can do "or" and get in 1 or 0 (because "or" is bitwise)
	mov bx, [word ptr bp + 6]
	or [byte ptr bx + di], dl
	pop cx
permutation_end:
	loop permutation_loop
	popa
	pop bp
	ret 8
endp permutation
; --------------------------------------------- PRINTSTRING ---------------------------------------------
; in: data offset
; out: print data from offset
; --------------------------------------------- PRINTSTRING ---------------------------------------------
proc printstring
	push bp
	mov bp, sp
	pusha
	mov dx, [word ptr bp + 4]
	mov ah, 09h
	int 21h
	mov dx, offset blank
	mov ah, 09h
	int 21h
	popa
	pop bp
	ret 2
endp printstring
; --------------------------------------------- READSTRING ---------------------------------------------
; in: buffer offset
; out: input data into buffer
; --------------------------------------------- READSTRING ---------------------------------------------
proc readstring
	push bp
	mov bp, sp
	pusha
	mov dx, [word ptr bp + 4]
	mov ah, 0Ah
	int 21h
	mov dx, offset blank
	mov ah, 09h
	int 21h
	popa
	pop bp
	ret 2
endp readstring
; --------------------------------------------- SHIFT_KEYS ---------------------------------------------
; in key offset (n - 1) and the generated key offset (n)
; shifts the permute_PC1 keys (C and D)
; --------------------------------------------- SHIFT_KEYS ---------------------------------------------
proc shift_keys
	push bp
	mov bp, sp
	pusha
; shifts the left byte and takes from the carry flag the bit that got away, saves it for the right byte in the new key
	xor ax, ax
	xor dx, dx
	mov bx, [word ptr bp + 6]
	mov ah, [byte ptr bx]
	shl ax, 1
	rcl dx, 1
	mov bx, [word ptr bp + 4]
	mov [byte ptr bx], ah
; dx shifted 4 times more because we want to put the byte from the carry flag to the high side of the new byte
	shl dx, 4
	mov [shift_keys_right_byte], dl
; shifts the second left byte and takes from the carry flag the bit that got away, saves it for the left byte in the new key
	xor ax, ax
	xor dx, dx
	mov bx, [word ptr bp + 6]
	mov ah, [byte ptr bx + 1]
	shl ax, 1
	rcl dx, 1
	mov bx, [word ptr bp + 4]
	mov [byte ptr bx + 1], ah
	mov [shift_keys_left_byte], dl
; shifts the second right byte and takes from the carry flag the bit that got away, saves it for the second left byte in the new key
	xor ax, ax
	xor dx, dx
	mov bx, [word ptr bp + 6]
	mov ah, [byte ptr bx + 2]
	shl ax, 1
	rcl dx, 1
	mov bx, [word ptr bp + 4]
	mov [byte ptr bx + 2], ah
	mov [shift_keys_second_left_byte], dl
; shifts the right byte and takes from the carry flag the bit that got away, saves it for the second right byte in the new key
	xor ax, ax
	xor dx, dx
	mov bx, [word ptr bp + 6]
	mov ah, [byte ptr bx + 3]
	shl ax, 1
	rcl dx, 1
	mov bx, [word ptr bp + 4]
	mov [byte ptr bx + 3], ah
	mov [shift_keys_second_right_byte], dl
; takes the saved second left bit for the left byte
	mov bx, [word ptr bp + 4]
	mov dl, [shift_keys_left_byte]
	or [byte ptr bx], dl
; takes the saved second right bit for the second left byte
	mov dl, [shift_keys_second_left_byte]
	or [byte ptr bx + 1], dl
; takes the saved right bit for the second right byte
	mov dl, [shift_keys_second_right_byte]
	or [byte ptr bx + 2], dl
; takes the saved left bit for the right byte
	mov dl, [shift_keys_right_byte]
	or [byte ptr bx + 3], dl
	popa
	pop bp
	ret 4
endp shift_keys
; --------------------------------------------- SHIFT_KEYS_2 ---------------------------------------------
; like "shift_keys", but twice
; --------------------------------------------- SHIFT_KEYS_2 ---------------------------------------------
proc shift_keys_2
	push bp
	mov bp, sp
	pusha
	mov bx, [word ptr bp + 6]
	push bx
	mov bx, [word ptr bp + 4]
	push bx
	call shift_keys
	push bx
	push bx
	call shift_keys
	popa
	pop bp
	ret 4
endp shift_keys_2
; --------------------------------------------- CONNECT_ARR ---------------------------------------------
; joins 2 arrys into 1 (in 3 arrys offset and arry size through the stack)
; 2 arrys (db) in the same size, 1 arry twice as big
; --------------------------------------------- CONNECT_ARR ---------------------------------------------
proc connect_arr
	push bp
	mov bp, sp
	pusha
	mov cx, [word ptr bp + 4]
	xor di, di
	xor ax, ax
connect_arr1_loop:
	mov bx, [word ptr bp + 10]
	mov al, [byte ptr bx + di]
	mov bx, [word ptr bp + 6]
	add bx, 2
	mov [byte ptr bx + di], al
	inc di
	loop connect_arr1_loop
	mov cx, [word ptr bp + 4]
	xor di, di
	xor ax, ax
connect_arr2_loop:
	mov bx, [word ptr bp + 8]
	mov al, [byte ptr bx + di]
	mov bx, [word ptr bp + 6]
	add bx, 2
	push di
	add di, [word ptr bp + 4]
	mov [byte ptr bx + di], al
	pop di
	inc di
	loop connect_arr2_loop
	popa
	pop bp
	ret 8
endp connect_arr
; --------------------------------------------- Connect_Arr_Run4last ---------------------------------------------
; joins 2 arrys into 1 (in 3 arrys offset and arry size through the stack)
; 2 arrys (db) in the same size, 1 arry twice as big
; --------------------------------------------- Connect_Arr_Run4last ---------------------------------------------
proc connect_arr_run4last
	push bp
	mov bp, sp
	pusha
	mov cx, [word ptr bp + 4]
	dec cx
	xor di, di
	xor ax, ax
connect_arr_run4last_loop:
	mov bx, [word ptr bp + 10]
	mov al, [byte ptr bx + di]
	mov bx, [word ptr bp + 6]
	add bx, 2
	mov [byte ptr bx + di], al
	inc di
	loop connect_arr_run4last_loop
	mov bx, [word ptr bp + 10]
	mov al, [byte ptr bx + 3]
	shr al, 4
	shl al, 4
	mov bx, [word ptr bp + 6]
	add bx, 2
	mov [byte ptr bx + di], al
	mov cx, [word ptr bp + 4]
	xor di, di
connect_arr_run4last_loop2:
	xor ax, ax
	xor dx, dx
	mov bx, [word ptr bp + 8]
	mov al, [byte ptr bx + di]
	shr al, 4
	mov dh, [byte ptr bx + di]
	shl dh, 4
	mov bx, [word ptr bp + 6]
	add bx, 2
	push di
	add di, [word ptr bp + 4]
	or [byte ptr bx + di], dh
	dec di
	or [byte ptr bx + di], al
	pop di
	inc di
	loop connect_arr_run4last_loop2
	popa
	pop bp
	ret 8
endp connect_arr_run4last
; --------------------------------------------- COPY_ARR ---------------------------------------------
; 1) push the arry offset you want to copy from
; 2) push the arry offset you want to copy to
; 3) push arrys lengh
; --------------------------------------------- COPY_ARR ---------------------------------------------
proc copy_arr
	push bp
	mov bp, sp
	pusha
	xor di, di
	mov cx, [word ptr bp + 4]
copy_arr_loop:
	mov bx, [word ptr bp + 8]
	mov al, [byte ptr bx + di]
	mov bx, [word ptr bp + 6]
	mov [byte ptr bx + di], al
	inc di
	loop copy_arr_loop
	popa
	pop bp
	ret 6
endp copy_arr
; --------------------------------------------- XOR_ARR ---------------------------------------------
; 1) push offset arr XORed (xor arr XORed, arr XORed with)
; 2) push offset arr XORed with
; 3) push arrys lengh
; --------------------------------------------- XOR_ARR ---------------------------------------------
proc arr_xor
	push bp
	mov bp, sp
	pusha
	xor di, di
	mov cx, [word ptr bp + 4]
arr_xor_loop:
	mov bx, [word ptr bp + 6]
	mov al, [byte ptr bx + di]
	mov bx, [word ptr bp + 8]
	xor [byte ptr bx + di], al
	inc di
	loop arr_xor_loop
	popa
	pop bp
	ret 6
endp arr_xor
; --------------------------------------------- S_Box_1, 2, 3, 4, 5, 6, 7, 8 all the S Boxes take the same input ---------------------------------------------
; 1) push offset arr taken 6 bits from
; 2) push offset arr copyed 4 bits to
; --------------------------------------------- S_Box_1, 2, 3, 4, 5, 6, 7, 8 all the S Boxes take the same input ---------------------------------------------
proc S_Box_1
	push bp
	mov bp, sp
	pusha
	mov bx, [word ptr bp + 6]
	mov ah, [byte ptr bx]
	xor dx, dx
	shl ah, 1
	rcl dx, 1
	mov al, [byte ptr bx]
	shr al, 3
	rcl dx, 1
	mov ax, 16
	mul dl
	mov di, ax
	xor dx, dx
	mov ah, [byte ptr bx]
	shl ah, 2
	rcl dx, 1
	shl ah, 1
	rcl dx, 1
	shl ah, 1
	rcl dx, 1
	shl ah, 1
	rcl dx, 1
	add di, dx
	mov ah, [byte ptr S_Box1 + di]
	shl ah, 4
	mov bx, [word ptr bp + 4]
	or [byte ptr bx], ah
	popa
	pop bp
	ret 4
endp S_Box_1
;--------------------
proc S_Box_2
	push bp
	mov bp, sp
	pusha
	mov bx, [word ptr bp + 6]
	mov al, [byte ptr bx]
	xor dx, dx
	shr al, 2
	rcl dx, 1
	mov ah, [byte ptr bx + 1]
	shl ah, 4
	rcl dx, 1
	mov ax, 16
	mul dl
	mov di, ax
	xor dx, dx
	mov al, [byte ptr bx]
	shr al, 1
	rcl dx, 1
	mov ah, [byte ptr bx + 1]
	shl ah, 1
	rcl dx, 1
	shl ah, 1
	rcl dx, 1
	shl ah, 1
	rcl dx, 1
	add di, dx
	mov ah, [byte ptr S_Box2 + di]
	mov bx, [word ptr bp + 4]
	or [byte ptr bx], ah
	popa
	pop bp
	ret 4
endp S_Box_2
;--------------------
proc S_Box_3
	push bp
	mov bp, sp
	pusha
	mov bx, [word ptr bp + 6]
	mov al, [byte ptr bx + 1]
	xor dx, dx
	shr al, 4
	rcl dx, 1
	mov ah, [byte ptr bx + 2]
	shl ah, 2
	rcl dx, 1
	mov ax, 16
	mul dl
	mov di, ax
	xor dx, dx
	mov ah, [byte ptr bx + 1]
	shl ah, 6
	rcl dx, 1
	shl ah, 1
	rcl dx, 1
	shl ah, 1
	rcl dx, 1
	mov ah, [byte ptr bx + 2]
	shl ah, 1
	rcl dx, 1
	add di, dx
	mov ah, [byte ptr S_Box3 + di]
	shl ah, 4
	mov bx, [word ptr bp + 4]
	or [byte ptr bx + 1], ah
	popa
	pop bp
	ret 4
endp S_Box_3
;--------------------
proc S_Box_4
	push bp
	mov bp, sp
	pusha
	mov bx, [word ptr bp + 6]
	mov ah, [byte ptr bx + 2]
	xor dx, dx
	shl ah, 3
	rcl dx, 1
	mov al, [byte ptr bx + 2]
	shr al, 1
	rcl dx, 1
	mov ax, 16
	mul dl
	mov di, ax
	xor dx, dx
	mov ah, [byte ptr bx + 2]
	shl ah, 4
	rcl dx, 1
	shl ah, 1
	rcl dx, 1
	shl ah, 1
	rcl dx, 1
	shl ah, 1
	rcl dx, 1
	add di, dx
	mov ah, [byte ptr S_Box4 + di]
	mov bx, [word ptr bp + 4]
	or [byte ptr bx + 1], ah
	popa
	pop bp
	ret 4
endp S_Box_4
;--------------------
proc S_Box_5
	push bp
	mov bp, sp
	pusha
	mov bx, [word ptr bp + 6]
	mov ah, [byte ptr bx + 3]
	xor dx, dx
	shl ah, 1
	rcl dx, 1
	mov al, [byte ptr bx + 3]
	shr al, 3
	rcl dx, 1
	mov ax, 16
	mul dl
	mov di, ax
	xor dx, dx
	mov ah, [byte ptr bx + 3]
	shl ah, 2
	rcl dx, 1
	shl ah, 1
	rcl dx, 1
	shl ah, 1
	rcl dx, 1
	shl ah, 1
	rcl dx, 1
	add di, dx
	mov ah, [byte ptr S_Box5 + di]
	shl ah, 4
	mov bx, [word ptr bp + 4]
	or [byte ptr bx + 2], ah
	popa
	pop bp
	ret 4
endp S_Box_5
;--------------------
proc S_Box_6
	push bp
	mov bp, sp
	pusha
	mov bx, [word ptr bp + 6]
	mov al, [byte ptr bx + 3]
	xor dx, dx
	shr al, 2
	rcl dx, 1
	mov ah, [byte ptr bx + 4]
	shl ah, 4
	rcl dx, 1
	mov ax, 16
	mul dl
	mov di, ax
	xor dx, dx
	mov al, [byte ptr bx + 3]
	shr al, 1
	rcl dx, 1
	mov ah, [byte ptr bx + 4]
	shl ah, 1
	rcl dx, 1
	shl ah, 1
	rcl dx, 1
	shl ah, 1
	rcl dx, 1
	add di, dx
	mov ah, [byte ptr S_Box6 + di]
	mov bx, [word ptr bp + 4]
	or [byte ptr bx + 2], ah
	popa
	pop bp
	ret 4
endp S_Box_6
;--------------------
proc S_Box_7
	push bp
	mov bp, sp
	pusha
	mov bx, [word ptr bp + 6]
	mov al, [byte ptr bx + 4]
	xor dx, dx
	shr al, 4
	rcl dx, 1
	mov ah, [byte ptr bx + 5]
	shl ah, 2
	rcl dx, 1
	mov ax, 16
	mul dl
	mov di, ax
	xor dx, dx
	mov ah, [byte ptr bx + 4]
	shl ah, 6
	rcl dx, 1
	shl ah, 1
	rcl dx, 1
	shl ah, 1
	rcl dx, 1
	mov ah, [byte ptr bx + 5]
	shl ah, 1
	rcl dx, 1
	add di, dx
	mov ah, [byte ptr S_Box7 + di]
	shl ah, 4
	mov bx, [word ptr bp + 4]
	or [byte ptr bx + 3], ah
	popa
	pop bp
	ret 4
endp S_Box_7
;--------------------
proc S_Box_8
	push bp
	mov bp, sp
	pusha
	mov bx, [word ptr bp + 6]
	mov ah, [byte ptr bx + 5]
	xor dx, dx
	shl ah, 3
	rcl dx, 1
	mov al, [byte ptr bx + 5]
	shr al, 1
	rcl dx, 1
	mov ax, 16
	mul dl
	mov di, ax
	xor dx, dx
	mov ah, [byte ptr bx + 5]
	shl ah, 4
	rcl dx, 1
	shl ah, 1
	rcl dx, 1
	shl ah, 1
	rcl dx, 1
	shl ah, 1
	rcl dx, 1
	add di, dx
	mov ah, [byte ptr S_Box8 + di]
	mov bx, [word ptr bp + 4]
	or [byte ptr bx + 3], ah
	popa
	pop bp
	ret 4
endp S_Box_8
; --------------------------------------------- AUTO CALL PROC S_Box_ 1 to 8 ---------------------------------------------
; 1) push offset arr taken 6 bits from
; 2) push offset arr copyed 4 bits to
; --------------------------------------------- AUTO CALL PROC S_Box_ 1 to 8 ---------------------------------------------
proc S_Box1to8
	push bp
	mov bp, sp
	pusha
	mov bx, [word ptr bp + 6]
	push bx
	mov bx, [word ptr bp + 4]
	push bx
	call S_Box_1
	mov bx, [word ptr bp + 6]
	push bx
	mov bx, [word ptr bp + 4]
	push bx
	call S_Box_2
	mov bx, [word ptr bp + 6]
	push bx
	mov bx, [word ptr bp + 4]
	push bx
	call S_Box_3
	mov bx, [word ptr bp + 6]
	push bx
	mov bx, [word ptr bp + 4]
	push bx
	call S_Box_4
	mov bx, [word ptr bp + 6]
	push bx
	mov bx, [word ptr bp + 4]
	push bx
	call S_Box_5
	mov bx, [word ptr bp + 6]
	push bx
	mov bx, [word ptr bp + 4]
	push bx
	call S_Box_6
	mov bx, [word ptr bp + 6]
	push bx
	mov bx, [word ptr bp + 4]
	push bx
	call S_Box_7
	mov bx, [word ptr bp + 6]
	push bx
	mov bx, [word ptr bp + 4]
	push bx
	call S_Box_8
	popa
	pop bp
	ret 4
endp S_Box1to8
; --------------------------------------------- AUTO CALL E_TABLE, XOR_ARR, S_Box1to8, permutation, XOR_ARR ---------------------------------------------
; 1) push offset S_n_00		+ 20
; 2) push offset L_n_00		+ 18
; 3) push offset L(n-1)		+ 16
; 4) push offset R(n-1)		+ 14
; 5) push offset Ln			+ 12
; 6) push offset E_R_(n-1)	+ 10
; 7) push offset K_n		+ 8
; 8) push offset S_n		+ 6
; 9) push offset R_n		+ 4
; --------------------------------------------- AUTO CALL E_TABLE, XOR_ARR, S_Box1to8, permutation, XOR_ARR ---------------------------------------------
proc Final_Stage
	push bp
	mov bp, sp
	pusha
	mov bx, [word ptr bp + 14]
	push bx
	mov bx, [word ptr bp + 12]
	push bx
	push 4
	call copy_arr
	mov bx, [word ptr bp + 12]
	push bx
	mov bx, [word ptr bp + 18]
	add bx, 2
	push bx
	push 4
	call copy_arr
	mov bx, [word ptr bp + 18]
	push bx
	push offset E_TABLE
	mov bx, [word ptr bp + 10]
	push bx
	push 48
	call permutation
	mov bx, [word ptr bp + 8]
	push bx
	mov bx, [word ptr bp + 10]
	push bx
	push 6
	call arr_xor
	mov bx, [word ptr bp + 8]
	push bx
	mov bx, [word ptr bp + 6]
	push bx
	call S_Box1to8
	mov bx, [word ptr bp + 6]
	push bx
	mov bx, [word ptr bp + 20]
	add bx, 2
	push bx
	push 4
	call copy_arr
	mov bx, [word ptr bp + 20]
	push bx
	push offset P_AFTER_SBOXES
	mov bx, [word ptr bp + 4]
	push bx
	push 32
	call permutation
	mov bx, [word ptr bp + 4]
	push bx
	mov bx, [word ptr bp + 16]
	push bx
	push 4
	call arr_xor
	popa
	pop bp
	ret 18
endp Final_Stage
; --------------------------------------------- HEX TO ASCII AND PRINT---------------------------------------------
; push offset of data
; push data lengh
; --------------------------------------------- HEX TO ASCII AND PRINT---------------------------------------------
proc hex_to_ascii
	push bp
	mov bp, sp
	pusha
	mov cx, [word ptr bp + 4]
	xor di, di
hex_to_ascii_loop:
	mov bx, [word ptr bp + 6]
	xor dx, dx
	mov dl, [byte ptr bx + di]
	shr dl, 4
	mov ah, 2
	cmp dl, 0 ; char "0"
	je char_0
	cmp dl, 1 ; char "1"
	je char_1
	cmp dl, 2 ; char "2"
	je char_2
	cmp dl, 3 ; char "3"
	je char_3
	cmp dl, 4 ; char "4"
	je char_4
	cmp dl, 5 ; char "5"
	je char_5
	cmp dl, 6 ; char "6"
	je char_6
	cmp dl, 7 ; char "7"
	je char_7
	cmp dl, 8 ; char "8"
	je char_8
	cmp dl, 9 ; char "9"
	je char_9
	cmp dl, 0Ah ; char "A"
	je char_a
	cmp dl, 0Bh ; char "B"
	je char_b
	cmp dl, 0Ch ; char "C"
	je char_c
	cmp dl, 0Dh ; char "D"
	je char_d
	cmp dl, 0Eh ; char "E"
	je char_e
	cmp dl, 0Fh ; char "F"
	je char_f
hex_to_ascii_loop_middle_2:
	jmp hex_to_ascii_loop
char_0:
	mov dl, '0'
	int 21h
	jmp hextoascii_p2
char_1:
	mov dl, '1'
	int 21h
	jmp hextoascii_p2
char_2:
	mov dl, '2'
	int 21h
	jmp hextoascii_p2
char_3:
	mov dl, '3'
	int 21h
	jmp hextoascii_p2
char_4:
	mov dl, '4'
	int 21h
	jmp hextoascii_p2
char_5:
	mov dl, '5'
	int 21h
	jmp hextoascii_p2
char_6:
	mov dl, '6'
	int 21h
	jmp hextoascii_p2
char_7:
	mov dl, '7'
	int 21h
	jmp hextoascii_p2
char_8:
	mov dl, '8'
	int 21h
	jmp hextoascii_p2
char_9:
	mov dl, '9'
	int 21h
	jmp hextoascii_p2
char_a:
	mov dl, 'A'
	int 21h
	jmp hextoascii_p2
char_b:
	mov dl, 'B'
	int 21h
	jmp hextoascii_p2
char_c:
	mov dl, 'C'
	int 21h
	jmp hextoascii_p2
char_d:
	mov dl, 'D'
	int 21h
	jmp hextoascii_p2
char_e:
	mov dl, 'E'
	int 21h
	jmp hextoascii_p2
char_f:
	mov dl, 'F'
	int 21h
hextoascii_p2:
	mov bx, [word ptr bp + 6]
	xor dx, dx
	mov dh, [byte ptr bx + di]
	shl dh, 4
	shr dh, 4
	mov ah, 2
	cmp dh, 0 ; char "0"
	je char_0_p2
	cmp dh, 1 ; char "1"
	je char_1_p2
	cmp dh, 2 ; char "2"
	je char_2_p2
	cmp dh, 3 ; char "3"
	je char_3_p2
	cmp dh, 4 ; char "4"
	je char_4_p2
	cmp dh, 5 ; char "5"
	je char_5_p2
	cmp dh, 6 ; char "6"
	je char_6_p2
	cmp dh, 7 ; char "7"
	je char_7_p2
	cmp dh, 8 ; char "8"
	je char_8_p2
	cmp dh, 9 ; char "9"
	je char_9_p2
	cmp dh, 0Ah ; char "A"
	je char_a_p2
	cmp dh, 0Bh ; char "B"
	je char_b_p2
	cmp dh, 0Ch ; char "C"
	je char_c_p2
	cmp dh, 0Dh ; char "D"
	je char_d_p2
	cmp dh, 0Eh ; char "E"
	je char_e_p2
	cmp dh, 0Fh ; char "F"
	je char_f_p2
char_0_p2:
	mov dl, '0'
	int 21h
	jmp hextoascii_end
char_1_p2:
	mov dl, '1'
	int 21h
	jmp hextoascii_end
char_2_p2:
	mov dl, '2'
	int 21h
	jmp hextoascii_end
char_3_p2:
	mov dl, '3'
	int 21h
	jmp hextoascii_end
char_4_p2:
	mov dl, '4'
	int 21h
	jmp hextoascii_end
char_5_p2:
	mov dl, '5'
	int 21h
	jmp hextoascii_end
char_6_p2:
	mov dl, '6'
	int 21h
	jmp hextoascii_end
char_7_p2:
	mov dl, '7'
	int 21h
	jmp hextoascii_end
hex_to_ascii_loop_middle:
	jmp hex_to_ascii_loop_middle_2
char_8_p2:
	mov dl, '8'
	int 21h
	jmp hextoascii_end
char_9_p2:
	mov dl, '9'
	int 21h
	jmp hextoascii_end
char_a_p2:
	mov dl, 'A'
	int 21h
	jmp hextoascii_end
char_b_p2:
	mov dl, 'B'
	int 21h
	jmp hextoascii_end
char_c_p2:
	mov dl, 'C'
	int 21h
	jmp hextoascii_end
char_d_p2:
	mov dl, 'D'
	int 21h
	jmp hextoascii_end
char_e_p2:
	mov dl, 'E'
	int 21h
	jmp hextoascii_end
char_f_p2:
	mov dl, 'F'
	int 21h
hextoascii_end:
	inc di
	dec cx
	cmp cx, 0
	ja hex_to_ascii_loop_middle
	popa
	pop bp
	ret 4
endp hex_to_ascii
; --------------------------------------------- DES_ENCRYPTION ---------------------------------------------
;
;
; --------------------------------------------- DES_ENCRYPTION ---------------------------------------------
proc DES_Encryption
;________________________________________________________________________________________________________________________________________
;|-------------- START MESSAGES & INPUTS --------------- START MESSAGES & INPUTS --------------- START MESSAGES & INPUTS ---------------|
;|______________________________________________________________________________________________________________________________________|
	mov al, [byte ptr what_to_do + 2]
	cmp al, "3"
	je DES3_Encryption_Process
	push offset between_prints
	call printstring
	push offset msg1
	call printstring
	push offset input_data
	call readstring
	push offset dollar
	call printstring
	push offset between_prints
	call printstring
	push offset blank
	call printstring
	push offset between_prints
	call printstring
	push offset msg2
	call printstring
	push offset input_key
	call readstring
	push offset dollar
	call printstring
	push offset between_prints
	call printstring
DES3_Encryption_Process:
;IF INPUT KEY IS LESS THEN 8 BYTES WE NEED TO DELETE THE LAST BYTE OF THE INPUT BECAUSE IT IS THE "ENTER" KEY
	push ax
	push bx
	xor bx, bx
	mov bl, [byte ptr input_key + 1]
	cmp bl, 008h
	je input_key_8
	mov ax, 0
	add bx, 2
	mov [byte ptr input_key + bx], 0
input_key_8:
	pop bx
	pop ax
;_____________________________________________________________________________________________________________________________________________
;|------------------------- PERMUTE PC1 ------------------------- PERMUTE PC1 ------------------------- PERMUTE PC1 -------------------------|
;|___________________________________________________________________________________________________________________________________________|
	push offset input_key
	push offset PC1
	push offset pc1_key
	push 56
	call permutation
; NOW WE NEED TO DIVIDE THE KET (AFTER PERMUTATION) TO 2 HALFS
; THE PROCCES FOR KEY "C_0"
; 3 FIRST BYTES COPY EXACTLY
	mov cx, 3
	xor di, di
part_of_left_half_key:
	xor ax, ax
	mov ah, [byte ptr pc1_key + di]
	mov [byte ptr C_0 + di], ah
	inc di
	loop part_of_left_half_key
; 4 FIRST BITS IN THE FOURTH BYTE COPYED
	xor ax, ax
	mov al, [byte ptr pc1_key + 3]
	shr ax, 4
	shl ax, 4
	or [byte ptr C_0 + 3], al
; THE PROCCES FOR KEY "D_0"
; ALL THE RIGHT BITS NEED TO BE MOVED 4 BITS TO THE LEFT AND COPY
	mov cx, 4
	mov di, 3
	mov [counter], 0
part_1_of_right_half_key:
	xor ax, ax
	mov ah, [byte ptr pc1_key + di]
	shl ax, 4
	push di
	mov di, [counter]
	or [byte ptr D_0 + di], ah
	pop di
	inc di
	inc [counter]
	loop part_1_of_right_half_key
; ALL THE LEFT BITS NEED TO BE MOVED 4 BITS TO THE RIGHT AND COPY
	mov cx, 3
	mov di, 4
	mov [counter], 0
part_2_of_right_half_key:
	xor dx, dx
	mov dl, [byte ptr pc1_key + di]
	shr dx, 4
	push di
	mov di, [counter]
	or [byte ptr D_0 + di], dl
	pop di
	inc di
	inc [counter]
	loop part_2_of_right_half_key
;________________________________________________________________________________________________________________________________________________________________________
;|---------------------- 16 KEYS CREATION (C & D) ---------------------- 16 KEYS CREATION (C & D) ---------------------- 16 KEYS CREATION (C & D) ----------------------|
;|______________________________________________________________________________________________________________________________________________________________________|
; shifts each key (starting with c_0 and ending with c_16)
; the keys 1,2,9,16 get shifted once, the rest twice
	push offset C_0
	push offset C_1
	call shift_keys
	push offset C_1
	push offset C_2
	call shift_keys
	push offset C_2
	push offset C_3
	call shift_keys_2
	push offset C_3
	push offset C_4
	call shift_keys_2
	push offset C_4
	push offset C_5
	call shift_keys_2
	push offset C_5
	push offset C_6
	call shift_keys_2
	push offset C_6
	push offset C_7
	call shift_keys_2
	push offset C_7
	push offset C_8
	call shift_keys_2
	push offset C_8
	push offset C_9
	call shift_keys
	push offset C_9
	push offset C_10
	call shift_keys_2
	push offset C_10
	push offset C_11
	call shift_keys_2
	push offset C_11
	push offset C_12
	call shift_keys_2
	push offset C_12
	push offset C_13
	call shift_keys_2
	push offset C_13
	push offset C_14
	call shift_keys_2
	push offset C_14
	push offset C_15
	call shift_keys_2
	push offset C_15
	push offset C_16
	call shift_keys
; shifts each key (starting with d_0 and ending with d_16)
; the keys 1,2,9,16 get shifted once, the rest twice
	push offset D_0
	push offset D_1
	call shift_keys
	push offset D_1
	push offset D_2
	call shift_keys
	push offset D_2
	push offset D_3
	call shift_keys_2
	push offset D_3
	push offset D_4
	call shift_keys_2
	push offset D_4
	push offset D_5
	call shift_keys_2
	push offset D_5
	push offset D_6
	call shift_keys_2
	push offset D_6
	push offset D_7
	call shift_keys_2
	push offset D_7
	push offset D_8
	call shift_keys_2
	push offset D_8
	push offset D_9
	call shift_keys
	push offset D_9
	push offset D_10
	call shift_keys_2
	push offset D_10
	push offset D_11
	call shift_keys_2
	push offset D_11
	push offset D_12
	call shift_keys_2
	push offset D_12
	push offset D_13
	call shift_keys_2
	push offset D_13
	push offset D_14
	call shift_keys_2
	push offset D_14
	push offset D_15
	call shift_keys_2
	push offset D_15
	push offset D_16
	call shift_keys
;______________________________________________________________________________________________________________________________________________________
;|---------------- CONNECT CnDn (1<= n <= 16) ---------------- CONNECT CnDn (1<= n <= 16) ---------------- CONNECT CnDn (1<= n <= 16) ----------------|
;|____________________________________________________________________________________________________________________________________________________|
	push offset C_1
	push offset D_1
	push offset C_D_1
	push 4
	call connect_arr_run4last
	push offset C_2
	push offset D_2
	push offset C_D_2
	push 4
	call connect_arr_run4last
	push offset C_3
	push offset D_3
	push offset C_D_3
	push 4
	call connect_arr_run4last
	push offset C_4
	push offset D_4
	push offset C_D_4
	push 4
	call connect_arr_run4last
	push offset C_5
	push offset D_5
	push offset C_D_5
	push 4
	call connect_arr_run4last
	push offset C_6
	push offset D_6
	push offset C_D_6
	push 4
	call connect_arr_run4last
	push offset C_7
	push offset D_7
	push offset C_D_7
	push 4
	call connect_arr_run4last
	push offset C_8
	push offset D_8
	push offset C_D_8
	push 4
	call connect_arr_run4last
	push offset C_9
	push offset D_9
	push offset C_D_9
	push 4
	call connect_arr_run4last
	push offset C_10
	push offset D_10
	push offset C_D_10
	push 4
	call connect_arr_run4last
	push offset C_11
	push offset D_11
	push offset C_D_11
	push 4
	call connect_arr_run4last
	push offset C_12
	push offset D_12
	push offset C_D_12
	push 4
	call connect_arr_run4last
	push offset C_13
	push offset D_13
	push offset C_D_13
	push 4
	call connect_arr_run4last
	push offset C_14
	push offset D_14
	push offset C_D_14
	push 4
	call connect_arr_run4last
	push offset C_15
	push offset D_15
	push offset C_D_15
	push 4
	call connect_arr_run4last
	push offset C_16
	push offset D_16
	push offset C_D_16
	push 4
	call connect_arr_run4last
;_____________________________________________________________________________________________________________________________________________
;|------------------------- PERMUTE PC2 ------------------------- PERMUTE PC2 ------------------------- PERMUTE PC2 -------------------------|
;|___________________________________________________________________________________________________________________________________________|
; creates key "K_1"
	push offset C_D_1
	push offset PC2
	push offset K_1
	push 48
	call permutation
; creates key "K_2"
	push offset C_D_2
	push offset PC2
	push offset K_2
	push 48
	call permutation
; creates key "K_3"
	push offset C_D_3
	push offset PC2
	push offset K_3
	push 48
	call permutation
; creates key "K_4"
	push offset C_D_4
	push offset PC2
	push offset K_4
	push 48
	call permutation
; creates key "K_5"
	push offset C_D_5
	push offset PC2
	push offset K_5
	push 48
	call permutation
; creates key "K_6"
	push offset C_D_6
	push offset PC2
	push offset K_6
	push 48
	call permutation
; creates key "K_7"
	push offset C_D_7
	push offset PC2
	push offset K_7
	push 48
	call permutation
; creates key "K_8"
	push offset C_D_8
	push offset PC2
	push offset K_8
	push 48
	call permutation
; creates key "K_9"
	push offset C_D_9
	push offset PC2
	push offset K_9
	push 48
	call permutation
; creates key "K_10"
	push offset C_D_10
	push offset PC2
	push offset K_10
	push 48
	call permutation
; creates key "K_11"
	push offset C_D_11
	push offset PC2
	push offset K_11
	push 48
	call permutation
; creates key "K_12"
	push offset C_D_12
	push offset PC2
	push offset K_12
	push 48
	call permutation
; creates key "K_13"
	push offset C_D_13
	push offset PC2
	push offset K_13
	push 48
	call permutation
; creates key "K_14"
	push offset C_D_14
	push offset PC2
	push offset K_14
	push 48
	call permutation
; creates key "K_15"
	push offset C_D_15
	push offset PC2
	push offset K_15
	push 48
	call permutation
; creates key "K_16"
	push offset C_D_16
	push offset PC2
	push offset K_16
	push 48
	call permutation
;________________________________________________________________________________________________________________________________________________
;|---------------- INITIAL PERMUTATION (IP) ---------------- INITIAL PERMUTATION (IP) ---------------- INITIAL PERMUTATION (IP) ----------------|
;|______________________________________________________________________________________________________________________________________________|
; permute data acording to IP table
	push offset input_data
	push offset IP
	push offset IP_data
	push 64
	call permutation
; make a left & right half of the data
	xor di, di
	mov cx, 8
IP_data_left_right:
	mov al, [byte ptr IP_data + di]
; to know if we need to copy the byte from above to the left part or right part (0,1,2,3 - left, 4,5,6,7 - right)
	cmp di, 3
	ja right_part
;left_part
	mov [byte ptr L_0 + di], al
	jmp IP_data_left_right_END
right_part:
	push di
	sub di, 4
	mov [byte ptr R_0 + di], al
	pop di
IP_data_left_right_END:
	inc di
	loop IP_data_left_right
;____________________________________________________________________________________________________________________________________________________________________________
;|1)E TABLE (DATA EXPANSION, 32 TO 48) 2)XOR DATA AFTER E WITH K(n) 3)UNEXPANSION (S BOXES, 48 TO 32) 4)PERMUTE AFTER THE UNEXPANSION 5)XOR L(n-1) WITH PERMUTED UNEXPANSION|
;|__________________________________________________________________________________________________________________________________________________________________________|
; create L_0 to 16 & R_0 to 16
	push offset S_1_00
	push offset L_1_00
	push offset L_0
	push offset R_0
	push offset L_1
	push offset E_R_0
	push offset K_1
	push offset S_1
	push offset R_1
	call Final_Stage
	push offset S_2_00
	push offset L_2_00
	push offset L_1
	push offset R_1
	push offset L_2
	push offset E_R_1
	push offset K_2
	push offset S_2
	push offset R_2
	call Final_Stage
	push offset S_3_00
	push offset L_3_00
	push offset L_2
	push offset R_2
	push offset L_3
	push offset E_R_2
	push offset K_3
	push offset S_3
	push offset R_3
	call Final_Stage
	push offset S_4_00
	push offset L_4_00
	push offset L_3
	push offset R_3
	push offset L_4
	push offset E_R_3
	push offset K_4
	push offset S_4
	push offset R_4
	call Final_Stage
	push offset S_5_00
	push offset L_5_00
	push offset L_4
	push offset R_4
	push offset L_5
	push offset E_R_4
	push offset K_5
	push offset S_5
	push offset R_5
	call Final_Stage
	push offset S_6_00
	push offset L_6_00
	push offset L_5
	push offset R_5
	push offset L_6
	push offset E_R_5
	push offset K_6
	push offset S_6
	push offset R_6
	call Final_Stage
	push offset S_7_00
	push offset L_7_00
	push offset L_6
	push offset R_6
	push offset L_7
	push offset E_R_6
	push offset K_7
	push offset S_7
	push offset R_7
	call Final_Stage
	push offset S_8_00
	push offset L_8_00
	push offset L_7
	push offset R_7
	push offset L_8
	push offset E_R_7
	push offset K_8
	push offset S_8
	push offset R_8
	call Final_Stage
	push offset S_9_00
	push offset L_9_00
	push offset L_8
	push offset R_8
	push offset L_9
	push offset E_R_8
	push offset K_9
	push offset S_9
	push offset R_9
	call Final_Stage
	push offset S_10_00
	push offset L_10_00
	push offset L_9
	push offset R_9
	push offset L_10
	push offset E_R_9
	push offset K_10
	push offset S_10
	push offset R_10
	call Final_Stage
	push offset S_11_00
	push offset L_11_00
	push offset L_10
	push offset R_10
	push offset L_11
	push offset E_R_10
	push offset K_11
	push offset S_11
	push offset R_11
	call Final_Stage
	push offset S_12_00
	push offset L_12_00
	push offset L_11
	push offset R_11
	push offset L_12
	push offset E_R_11
	push offset K_12
	push offset S_12
	push offset R_12
	call Final_Stage
	push offset S_13_00
	push offset L_13_00
	push offset L_12
	push offset R_12
	push offset L_13
	push offset E_R_12
	push offset K_13
	push offset S_13
	push offset R_13
	call Final_Stage
	push offset S_14_00
	push offset L_14_00
	push offset L_13
	push offset R_13
	push offset L_14
	push offset E_R_13
	push offset K_14
	push offset S_14
	push offset R_14
	call Final_Stage
	push offset S_15_00
	push offset L_15_00
	push offset L_14
	push offset R_14
	push offset L_15
	push offset E_R_14
	push offset K_15
	push offset S_15
	push offset R_15
	call Final_Stage
	push offset S_16_00
	push offset L_16_00
	push offset L_15
	push offset R_15
	push offset L_16
	push offset E_R_15
	push offset K_16
	push offset S_16
	push offset R_16
	call Final_Stage

; copy R_16 to the first 4 byted in R16_L16
	push offset R_16
	push offset R16_L16
	push 4
	call copy_arr
; copy L_16 to the last 4 bytes in R16_L16
	push offset L_16
	mov bx, offset R16_L16
	add bx, 4
	push bx
	push 4
	call copy_arr
; Final permutation acording to "IP^-1" table
	mov bx, offset R16_L16
	sub bx, 2
	push bx
	push offset IP_1
	push offset Encrypted_Data
	push 64
	call permutation
	mov al, [byte ptr what_to_do + 2]
	cmp al, "3"
	je DES3_Encryption_2
	push offset blank
	call printstring
	push offset between_prints
	call printstring
	push offset finish_msg
	call printstring
	push offset Encrypted_Data
	push 8
	call hex_to_ascii
	push offset dollar
	call printstring
	push offset dollar
	call printstring
	push offset between_prints
	call printstring
DES3_Encryption_2:
	ret
endp DES_Encryption
; --------------------------------------------- ASCII TO HEX - RETURN VALUE ---------------------------------------------
; push offset of output
; push offset of data
; push output lengh
; --------------------------------------------- ASCII TO HEX - RETURN VALUE ---------------------------------------------
proc ascii_to_hex
	push bp
	mov bp, sp
	pusha
	mov cx, [word ptr bp + 4]
	xor di, di
	mov [word ptr counter], 0
hex_RETURN_VAL_loop:
	mov bx, [word ptr bp + 6]
	xor dx, dx
	mov dl, [byte ptr bx + di]
	mov bx, [word ptr bp + 8]
	push di
	mov di, [word ptr counter]
	cmp dl, 030h ; char "0"
	je hex_RETURN_VAL_char_0
	cmp dl, 031h ; char "1"
	je hex_RETURN_VAL_char_1
	cmp dl, 032h ; char "2"
	je hex_RETURN_VAL_char_2
	cmp dl, 033h ; char "3"
	je hex_RETURN_VAL_char_3
	cmp dl, 034h ; char "4"
	je hex_RETURN_VAL_char_4
	cmp dl, 035h ; char "5"
	je hex_RETURN_VAL_char_5
	cmp dl, 036h ; char "6"
	je hex_RETURN_VAL_char_6
	cmp dl, 037h ; char "7"
	je hex_RETURN_VAL_char_7
	cmp dl, 038h ; char "8"
	je hex_RETURN_VAL_char_8
	cmp dl, 039h ; char "9"
	je hex_RETURN_VAL_char_9
	cmp dl, 041h ; char "A"
	je hex_RETURN_VAL_char_a
	cmp dl, 042h ; char "B"
	je hex_RETURN_VAL_char_b
	cmp dl, 043h ; char "C"
	je hex_RETURN_VAL_char_c
	cmp dl, 044h ; char "D"
	je hex_RETURN_VAL_char_d
	cmp dl, 045h ; char "E"
	je hex_RETURN_VAL_char_e
	cmp dl, 046h ; char "F"
	je hex_RETURN_VAL_char_f
hex_RETURN_VAL_char_0:
	mov [byte ptr bx + di], 000h
	jmp hex_RETURN_VAL_END_p1
hex_RETURN_VAL_char_1:
	mov [byte ptr bx + di], 010h
	jmp hex_RETURN_VAL_END_p1
hex_RETURN_VAL_char_2:
	mov [byte ptr bx + di], 020h
	jmp hex_RETURN_VAL_END_p1
hex_RETURN_VAL_loop_middle_2:
	jmp hex_RETURN_VAL_loop
hex_RETURN_VAL_char_3:
	mov [byte ptr bx + di], 030h
	jmp hex_RETURN_VAL_END_p1
hex_RETURN_VAL_char_4:
	mov [byte ptr bx + di], 040h
	jmp hex_RETURN_VAL_END_p1
hex_RETURN_VAL_char_5:
	mov [byte ptr bx + di], 050h
	jmp hex_RETURN_VAL_END_p1
hex_RETURN_VAL_char_6:
	mov [byte ptr bx + di], 060h
	jmp hex_RETURN_VAL_END_p1
hex_RETURN_VAL_char_7:
	mov [byte ptr bx + di], 070h
	jmp hex_RETURN_VAL_END_p1
hex_RETURN_VAL_char_8:
	mov [byte ptr bx + di], 080h
	jmp hex_RETURN_VAL_END_p1
hex_RETURN_VAL_char_9:
	mov [byte ptr bx + di], 090h
	jmp hex_RETURN_VAL_END_p1
hex_RETURN_VAL_char_a:
	mov [byte ptr bx + di], 0a0h
	jmp hex_RETURN_VAL_END_p1
hex_RETURN_VAL_char_b:
	mov [byte ptr bx + di], 0b0h
	jmp hex_RETURN_VAL_END_p1
hex_RETURN_VAL_char_c:
	mov [byte ptr bx + di], 0c0h
	jmp hex_RETURN_VAL_END_p1
hex_RETURN_VAL_char_d:
	mov [byte ptr bx + di], 0d0h
	jmp hex_RETURN_VAL_END_p1
hex_RETURN_VAL_char_e:
	mov [byte ptr bx + di], 0e0h
	jmp hex_RETURN_VAL_END_p1
hex_RETURN_VAL_char_f:
	mov [byte ptr bx + di], 0f0h
hex_RETURN_VAL_END_p1:
	pop di
	inc di
	inc di
	inc [word ptr counter]
	dec cx
	cmp cx, 0
	ja hex_RETURN_VAL_loop_middle_2
	mov cx, [word ptr bp + 4]
	mov di, 1
	mov [word ptr counter], 0
	xor dx, dx
hex_RETURN_VAL_p2:
	mov bx, [word ptr bp + 6]
	mov dh, [byte ptr bx + di]
	mov bx, [word ptr bp + 8]
	push di
	mov di, [word ptr counter]
	cmp dh, 030h ; char "0"
	je hex_RETURN_VAL_char_0_p2
	cmp dh, 031h ; char "1"
	je hex_RETURN_VAL_char_1_p2
	cmp dh, 032h ; char "2"
	je hex_RETURN_VAL_char_2_p2
	cmp dh, 033h ; char "3"
	je hex_RETURN_VAL_char_3_p2
	cmp dh, 034h ; char "4"
	je hex_RETURN_VAL_char_4_p2
	cmp dh, 035h ; char "5"
	je hex_RETURN_VAL_char_5_p2
	cmp dh, 036h ; char "6"
	je hex_RETURN_VAL_char_6_p2
	cmp dh, 037h ; char "7"
	je hex_RETURN_VAL_char_7_p2
	cmp dh, 038h ; char "8"
	je hex_RETURN_VAL_char_8_p2
	cmp dh, 039h ; char "9"
	je hex_RETURN_VAL_char_9_p2
	cmp dh, 041h ; char "A"
	je hex_RETURN_VAL_char_a_p2
	cmp dh, 042h ; char "B"
	je hex_RETURN_VAL_char_b_p2
	cmp dh, 043h ; char "C"
	je hex_RETURN_VAL_char_c_p2
	cmp dh, 044h ; char "D"
	je hex_RETURN_VAL_char_d_p2
	cmp dh, 045h ; char "E"
	je hex_RETURN_VAL_char_e_p2
	cmp dh, 046h ; char "F"
	je hex_RETURN_VAL_char_f_p2
hex_RETURN_VAL_char_0_p2:
	add [byte ptr bx + di], 00h
	jmp hex_RETURN_VAL_END_p2
hex_RETURN_VAL_char_1_p2:
	add [byte ptr bx + di], 01h
	jmp hex_RETURN_VAL_END_p2
hex_RETURN_VAL_char_2_p2:
	add [byte ptr bx + di], 02h
	jmp hex_RETURN_VAL_END_p2
hex_RETURN_VAL_p2_loop_middle_2:
	jmp hex_RETURN_VAL_p2
hex_RETURN_VAL_char_3_p2:
	add [byte ptr bx + di], 03h
	jmp hex_RETURN_VAL_END_p2
hex_RETURN_VAL_char_4_p2:
	add [byte ptr bx + di], 04h
	jmp hex_RETURN_VAL_END_p2
hex_RETURN_VAL_char_5_p2:
	add [byte ptr bx + di], 05h
	jmp hex_RETURN_VAL_END_p2
hex_RETURN_VAL_char_6_p2:
	add [byte ptr bx + di], 06h
	jmp hex_RETURN_VAL_END_p2
hex_RETURN_VAL_char_7_p2:
	add [byte ptr bx + di], 07h
	jmp hex_RETURN_VAL_END_p2
hex_RETURN_VAL_loop_middle:
	jmp hex_RETURN_VAL_loop_middle_2
hex_RETURN_VAL_char_8_p2:
	add [byte ptr bx + di], 08h
	jmp hex_RETURN_VAL_END_p2
hex_RETURN_VAL_char_9_p2:
	add [byte ptr bx + di], 09h
	jmp hex_RETURN_VAL_END_p2
hex_RETURN_VAL_char_a_p2:
	add [byte ptr bx + di], 0ah
	jmp hex_RETURN_VAL_END_p2
hex_RETURN_VAL_char_b_p2:
	add [byte ptr bx + di], 0bh
	jmp hex_RETURN_VAL_END_p2
hex_RETURN_VAL_char_c_p2:
	add [byte ptr bx + di], 0ch
	jmp hex_RETURN_VAL_END_p2
hex_RETURN_VAL_char_d_p2:
	add [byte ptr bx + di], 0dh
	jmp hex_RETURN_VAL_END_p2
hex_RETURN_VAL_char_e_p2:
	add [byte ptr bx + di], 0eh
	jmp hex_RETURN_VAL_END_p2
hex_RETURN_VAL_char_f_p2:
	add [byte ptr bx + di], 0fh
hex_RETURN_VAL_END_p2:
	pop di
	inc di
	inc di
	inc [word ptr counter]
	dec cx
	cmp cx, 0
	ja hex_RETURN_VAL_p2_loop_middle_2
	popa
	pop bp
	ret 6
endp ascii_to_hex
; --------------------------------------------- REVERSED_PERMUTATION ---------------------------------------------
; 1) push the data offset you want to perform the reversed permutation on			+ 10
; 2) push permutation table offset													+ 8
; 3) push the data output offset													+ 6
; 4) push the lengh of the permutation table (how many bits you are performing on)	+ 4
; --------------------------------------------- REVERSED_PERMUTATION ---------------------------------------------
proc reversed_permutation
	push bp
	mov bp, sp
	pusha
; loop to perform the reversed permutation
	mov cx, [word ptr bp + 4]
	xor di, di
reversed_permutation_loop:
	mov di, [word ptr bp + 4]
	sub di, cx
	xor bx, bx
	mov ax, di
	mov bl, 8
	div bl
	push cx
	push di
	mov bl, al
	mov di, bx
	xor cx, cx
	mov cl, ah
	inc cl
	mov bx, [word ptr bp + 10]
	mov ah, [byte ptr bx + di]
	pop di
	xor dx, dx
	shl ah, cl
	rcl dx, 1
	pop cx
	xor ax, ax
	mov bx, [word ptr bp + 8]
	mov al, [byte ptr bx + di]
	mov bx, 8
	div bl
	cmp ah, 0
	jne reversed_permutation_p2_not_zero
	dec al
	jmp reversed_permutation_p2_zero
reversed_permutation_p2_not_zero:
	push cx
	mov cl, 8
	sub cl, ah
	jmp reversed_permutation_p2
reversed_permutation_p2_zero:
	push cx
	mov cl, ah
reversed_permutation_p2:
	shl dx, cl
	pop cx
	mov bx, [word ptr bp + 6]
	mov ah, 0
	mov di, ax
	or [byte ptr bx + di], dl
	loop reversed_permutation_loop
	popa
	pop bp
	ret 8
endp reversed_permutation
; --------------------------------------------- DES_DECRYPTION ---------------------------------------------
;
;
; --------------------------------------------- DES_DECRYPTION ---------------------------------------------
proc DES_Decryption
	mov al, [byte ptr what_to_do + 2]
	cmp al, "3"
	je DES3_Decryption_Process
	push offset between_prints
	call printstring
	push offset msg1_Decryption
	call printstring
	push offset input_Encrypted_data
	call readstring
	push offset dollar
	call printstring
	push offset between_prints
	call printstring
	push offset blank
	call printstring
	push offset between_prints
	call printstring
	push offset msg2_Decryption
	call printstring
	push offset input_key
	call readstring
	push offset dollar
	call printstring
	push offset between_prints
	call printstring
;THE ENCRYPTED DATA IS INPUTED AS ASCII SO WE NEED TO CONVERT IT FROM ASCII CHARS TO HEX VALUE
	mov bx, offset input_data
	add bx, 2
	push bx
	mov bx, offset input_Encrypted_data
	add bx, 2
	push bx
	push 8
	call ascii_to_hex
DES3_Decryption_Process:
;IF INPUT KEY IS LESS THEN 8 BYTES WE NEED TO DELETE THE LAST BYTE OF THE INPUT BECAUSE IT IS THE "ENTER" KEY
	push ax
	push bx
	xor bx, bx
	mov bl, [byte ptr input_key + 1]
	cmp bl, 010h
	je input_key_8_2
	mov ax, 0
	add bx, 2
	mov [byte ptr input_key + bx], 0
input_key_8_2:
	pop bx
	pop ax
;_____________________________________________________________________________________________________________________________________________
;|------------------------- PERMUTE PC1 ------------------------- PERMUTE PC1 ------------------------- PERMUTE PC1 -------------------------|
;|___________________________________________________________________________________________________________________________________________|
	push offset input_key
	push offset PC1
	push offset pc1_key
	push 56
	call permutation
; NOW WE NEED TO DIVIDE THE KET (AFTER PERMUTATION) TO 2 HALFS
; THE PROCCES FOR KEY "C_0"
; 3 FIRST BYTES COPY EXACTLY
	mov cx, 3
	xor di, di
dec_part_of_left_half_key:
	xor ax, ax
	mov ah, [byte ptr pc1_key + di]
	mov [byte ptr C_0 + di], ah
	inc di
	loop dec_part_of_left_half_key
; 4 FIRST BITS IN THE FOURTH BYTE COPYED
	xor ax, ax
	mov al, [byte ptr pc1_key + 3]
	shr ax, 4
	shl ax, 4
	or [byte ptr C_0 + 3], al
; THE PROCCES FOR KEY "D_0"
; ALL THE RIGHT BITS NEED TO BE MOVED 4 BITS TO THE LEFT AND COPY
	mov cx, 4
	mov di, 3
	mov [counter], 0
dec_part_1_of_right_half_key:
	xor ax, ax
	mov ah, [byte ptr pc1_key + di]
	shl ax, 4
	push di
	mov di, [counter]
	or [byte ptr D_0 + di], ah
	pop di
	inc di
	inc [counter]
	loop dec_part_1_of_right_half_key
; ALL THE LEFT BITS NEED TO BE MOVED 4 BITS TO THE RIGHT AND COPY
	mov cx, 3
	mov di, 4
	mov [counter], 0
dec_part_2_of_right_half_key:
	xor dx, dx
	mov dl, [byte ptr pc1_key + di]
	shr dx, 4
	push di
	mov di, [counter]
	or [byte ptr D_0 + di], dl
	pop di
	inc di
	inc [counter]
	loop dec_part_2_of_right_half_key
;________________________________________________________________________________________________________________________________________________________________________
;|---------------------- 16 KEYS CREATION (C & D) ---------------------- 16 KEYS CREATION (C & D) ---------------------- 16 KEYS CREATION (C & D) ----------------------|
;|______________________________________________________________________________________________________________________________________________________________________|
; shifts each key (starting with c_0 and ending with c_16)
; the keys 1,2,9,16 get shifted once, the rest twice
	push offset C_0
	push offset C_1
	call shift_keys
	push offset C_1
	push offset C_2
	call shift_keys
	push offset C_2
	push offset C_3
	call shift_keys_2
	push offset C_3
	push offset C_4
	call shift_keys_2
	push offset C_4
	push offset C_5
	call shift_keys_2
	push offset C_5
	push offset C_6
	call shift_keys_2
	push offset C_6
	push offset C_7
	call shift_keys_2
	push offset C_7
	push offset C_8
	call shift_keys_2
	push offset C_8
	push offset C_9
	call shift_keys
	push offset C_9
	push offset C_10
	call shift_keys_2
	push offset C_10
	push offset C_11
	call shift_keys_2
	push offset C_11
	push offset C_12
	call shift_keys_2
	push offset C_12
	push offset C_13
	call shift_keys_2
	push offset C_13
	push offset C_14
	call shift_keys_2
	push offset C_14
	push offset C_15
	call shift_keys_2
	push offset C_15
	push offset C_16
	call shift_keys
; shifts each key (starting with d_0 and ending with d_16)
; the keys 1,2,9,16 get shifted once, the rest twice
	push offset D_0
	push offset D_1
	call shift_keys
	push offset D_1
	push offset D_2
	call shift_keys
	push offset D_2
	push offset D_3
	call shift_keys_2
	push offset D_3
	push offset D_4
	call shift_keys_2
	push offset D_4
	push offset D_5
	call shift_keys_2
	push offset D_5
	push offset D_6
	call shift_keys_2
	push offset D_6
	push offset D_7
	call shift_keys_2
	push offset D_7
	push offset D_8
	call shift_keys_2
	push offset D_8
	push offset D_9
	call shift_keys
	push offset D_9
	push offset D_10
	call shift_keys_2
	push offset D_10
	push offset D_11
	call shift_keys_2
	push offset D_11
	push offset D_12
	call shift_keys_2
	push offset D_12
	push offset D_13
	call shift_keys_2
	push offset D_13
	push offset D_14
	call shift_keys_2
	push offset D_14
	push offset D_15
	call shift_keys_2
	push offset D_15
	push offset D_16
	call shift_keys
;______________________________________________________________________________________________________________________________________________________
;|---------------- CONNECT CnDn (1<= n <= 16) ---------------- CONNECT CnDn (1<= n <= 16) ---------------- CONNECT CnDn (1<= n <= 16) ----------------|
;|____________________________________________________________________________________________________________________________________________________|
	push offset C_1
	push offset D_1
	push offset C_D_1
	push 4
	call connect_arr_run4last
	push offset C_2
	push offset D_2
	push offset C_D_2
	push 4
	call connect_arr_run4last
	push offset C_3
	push offset D_3
	push offset C_D_3
	push 4
	call connect_arr_run4last
	push offset C_4
	push offset D_4
	push offset C_D_4
	push 4
	call connect_arr_run4last
	push offset C_5
	push offset D_5
	push offset C_D_5
	push 4
	call connect_arr_run4last
	push offset C_6
	push offset D_6
	push offset C_D_6
	push 4
	call connect_arr_run4last
	push offset C_7
	push offset D_7
	push offset C_D_7
	push 4
	call connect_arr_run4last
	push offset C_8
	push offset D_8
	push offset C_D_8
	push 4
	call connect_arr_run4last
	push offset C_9
	push offset D_9
	push offset C_D_9
	push 4
	call connect_arr_run4last
	push offset C_10
	push offset D_10
	push offset C_D_10
	push 4
	call connect_arr_run4last
	push offset C_11
	push offset D_11
	push offset C_D_11
	push 4
	call connect_arr_run4last
	push offset C_12
	push offset D_12
	push offset C_D_12
	push 4
	call connect_arr_run4last
	push offset C_13
	push offset D_13
	push offset C_D_13
	push 4
	call connect_arr_run4last
	push offset C_14
	push offset D_14
	push offset C_D_14
	push 4
	call connect_arr_run4last
	push offset C_15
	push offset D_15
	push offset C_D_15
	push 4
	call connect_arr_run4last
	push offset C_16
	push offset D_16
	push offset C_D_16
	push 4
	call connect_arr_run4last
;_____________________________________________________________________________________________________________________________________________
;|------------------------- PERMUTE PC2 ------------------------- PERMUTE PC2 ------------------------- PERMUTE PC2 -------------------------|
;|___________________________________________________________________________________________________________________________________________|
; creates key "K_16"
	push offset C_D_1
	push offset PC2
	push offset K_16
	push 48
	call permutation
; creates key "K_15"
	push offset C_D_2
	push offset PC2
	push offset K_15
	push 48
	call permutation
; creates key "K_14"
	push offset C_D_3
	push offset PC2
	push offset K_14
	push 48
	call permutation
; creates key "K_13"
	push offset C_D_4
	push offset PC2
	push offset K_13
	push 48
	call permutation
; creates key "K_12"
	push offset C_D_5
	push offset PC2
	push offset K_12
	push 48
	call permutation
; creates key "K_11"
	push offset C_D_6
	push offset PC2
	push offset K_11
	push 48
	call permutation
; creates key "K_10"
	push offset C_D_7
	push offset PC2
	push offset K_10
	push 48
	call permutation
; creates key "K_9"
	push offset C_D_8
	push offset PC2
	push offset K_9
	push 48
	call permutation
; creates key "K_8"
	push offset C_D_9
	push offset PC2
	push offset K_8
	push 48
	call permutation
; creates key "K_7"
	push offset C_D_10
	push offset PC2
	push offset K_7
	push 48
	call permutation
; creates key "K_6"
	push offset C_D_11
	push offset PC2
	push offset K_6
	push 48
	call permutation
; creates key "K_5"
	push offset C_D_12
	push offset PC2
	push offset K_5
	push 48
	call permutation
; creates key "K_4"
	push offset C_D_13
	push offset PC2
	push offset K_4
	push 48
	call permutation
; creates key "K_3"
	push offset C_D_14
	push offset PC2
	push offset K_3
	push 48
	call permutation
; creates key "K_2"
	push offset C_D_15
	push offset PC2
	push offset K_2
	push 48
	call permutation
; creates key "K_1"
	push offset C_D_16
	push offset PC2
	push offset K_1
	push 48
	call permutation
;________________________________________________________________________________________________________________________________________________
;|---------------- INITIAL PERMUTATION (IP) ---------------- INITIAL PERMUTATION (IP) ---------------- INITIAL PERMUTATION (IP) ----------------|
;|______________________________________________________________________________________________________________________________________________|
; permute data acording to IP table
	push offset input_data
	push offset IP
	push offset IP_data
	push 64
	call permutation
; make a left & right half of the data
	xor di, di
	mov cx, 8
dec_IP_data_left_right:
	mov al, [byte ptr IP_data + di]
; to know if we need to copy the byte from above to the left part or right part (0,1,2,3 - left, 4,5,6,7 - right)
	cmp di, 3
	ja dec_right_part
;left_part
	mov [byte ptr L_16 + di], al
	jmp dec_IP_data_left_right_END
dec_right_part:
	push di
	sub di, 4
	mov [byte ptr R_16 + di], al
	pop di
dec_IP_data_left_right_END:
	inc di
	loop dec_IP_data_left_right
;____________________________________________________________________________________________________________________________________________________________________________
;|1)E TABLE (DATA EXPANSION, 32 TO 48) 2)XOR DATA AFTER E WITH K(n) 3)UNEXPANSION (S BOXES, 48 TO 32) 4)PERMUTE AFTER THE UNEXPANSION 5)XOR L(n-1) WITH PERMUTED UNEXPANSION|
;|__________________________________________________________________________________________________________________________________________________________________________|
; create L_16 to L_0 & R_16 to R_0
	push offset S_16_00
	push offset L_16_00
	push offset L_16
	push offset R_16
	push offset L_15
	push offset E_R_15
	push offset K_1
	push offset S_16
	push offset R_15
	call Final_Stage
	push offset S_15_00
	push offset L_15_00
	push offset L_15
	push offset R_15
	push offset L_14
	push offset E_R_14
	push offset K_2
	push offset S_15
	push offset R_14
	call Final_Stage
	push offset S_14_00
	push offset L_14_00
	push offset L_14
	push offset R_14
	push offset L_13
	push offset E_R_13
	push offset K_3
	push offset S_14
	push offset R_13
	call Final_Stage
	push offset S_13_00
	push offset L_13_00
	push offset L_13
	push offset R_13
	push offset L_12
	push offset E_R_12
	push offset K_4
	push offset S_13
	push offset R_12
	call Final_Stage
	push offset S_12_00
	push offset L_12_00
	push offset L_12
	push offset R_12
	push offset L_11
	push offset E_R_11
	push offset K_5
	push offset S_12
	push offset R_11
	call Final_Stage
	push offset S_11_00
	push offset L_11_00
	push offset L_11
	push offset R_11
	push offset L_10
	push offset E_R_10
	push offset K_6
	push offset S_11
	push offset R_10
	call Final_Stage
	push offset S_10_00
	push offset L_10_00
	push offset L_10
	push offset R_10
	push offset L_9
	push offset E_R_9
	push offset K_7
	push offset S_10
	push offset R_9
	call Final_Stage
	push offset S_9_00
	push offset L_9_00
	push offset L_9
	push offset R_9
	push offset L_8
	push offset E_R_8
	push offset K_8
	push offset S_9
	push offset R_8
	call Final_Stage
	push offset S_8_00
	push offset L_8_00
	push offset L_8
	push offset R_8
	push offset L_7
	push offset E_R_7
	push offset K_9
	push offset S_8
	push offset R_7
	call Final_Stage
	push offset S_7_00
	push offset L_7_00
	push offset L_7
	push offset R_7
	push offset L_6
	push offset E_R_6
	push offset K_10
	push offset S_7
	push offset R_6
	call Final_Stage
	push offset S_6_00
	push offset L_6_00
	push offset L_6
	push offset R_6
	push offset L_5
	push offset E_R_5
	push offset K_11
	push offset S_6
	push offset R_5
	call Final_Stage
	push offset S_5_00
	push offset L_5_00
	push offset L_5
	push offset R_5
	push offset L_4
	push offset E_R_4
	push offset K_12
	push offset S_5
	push offset R_4
	call Final_Stage
	push offset S_4_00
	push offset L_4_00
	push offset L_4
	push offset R_4
	push offset L_3
	push offset E_R_3
	push offset K_13
	push offset S_4
	push offset R_3
	call Final_Stage
	push offset S_3_00
	push offset L_3_00
	push offset L_3
	push offset R_3
	push offset L_2
	push offset E_R_2
	push offset K_14
	push offset S_3
	push offset R_2
	call Final_Stage
	push offset S_2_00
	push offset L_2_00
	push offset L_2
	push offset R_2
	push offset L_1
	push offset E_R_1
	push offset K_15
	push offset S_2
	push offset R_1
	call Final_Stage
	push offset S_1_00
	push offset L_1_00
	push offset L_1
	push offset R_1
	push offset L_0
	push offset E_R_0
	push offset K_16
	push offset S_1
	push offset R_0
	call Final_Stage
; copy R_0 to the first 4 byted in R16_L16
	push offset R_0
	push offset R16_L16
	push 4
	call copy_arr
; copy L_0 to the last 4 bytes in R16_L16
	push offset L_0
	mov bx, offset R16_L16
	add bx, 4
	push bx
	push 4
	call copy_arr
; reversed permutation acording to "IP" table
	push offset R16_L16
	push offset IP
	push offset Decrypted_Data
	push 64
	call reversed_permutation
	mov al, [byte ptr what_to_do + 2]
	cmp al, "3"
	je DES3_Decryption_2
	push offset blank
	call printstring
	push offset between_prints
	call printstring
	push offset finish_msg_Decryption
	call printstring
	push offset Decrypted_Data
	call printstring
	push offset dollar
	call printstring
	push offset dollar
	call printstring
	push offset between_prints
	call printstring
DES3_Decryption_2:
	ret
endp DES_DECRYPTION
; --------------------------------------------- CLEAN_DATA ---------------------------------------------
; clean everything that is needed again if you choose the des3 mode
;
; --------------------------------------------- CLEAN_DATA ---------------------------------------------
proc clean_data
	pusha
	push offset empty
	push offset pc1_key
	push 7
	call copy_arr
	push offset empty
	push offset C_0
	push 4
	call copy_arr
	push offset empty
	push offset D_0
	push 4
	call copy_arr
	mov [byte ptr shift_keys_left_byte], 0
	mov [byte ptr shift_keys_second_left_byte], 0
	mov [byte ptr shift_keys_second_right_byte], 0
	mov [byte ptr shift_keys_right_byte], 0
	push offset empty
	push offset C_1
	push 4
	call copy_arr
	push offset empty
	push offset C_2
	push 4
	call copy_arr
	push offset empty
	push offset C_3
	push 4
	call copy_arr
	push offset empty
	push offset C_4
	push 4
	call copy_arr
	push offset empty
	push offset C_5
	push 4
	call copy_arr
	push offset empty
	push offset C_6
	push 4
	call copy_arr
	push offset empty
	push offset C_7
	push 4
	call copy_arr
	push offset empty
	push offset C_8
	push 4
	call copy_arr
	push offset empty
	push offset C_9
	push 4
	call copy_arr
	push offset empty
	push offset C_10
	push 4
	call copy_arr
	push offset empty
	push offset C_11
	push 4
	call copy_arr
	push offset empty
	push offset C_12
	push 4
	call copy_arr
	push offset empty
	push offset C_13
	push 4
	call copy_arr
	push offset empty
	push offset C_14
	push 4
	call copy_arr
	push offset empty
	push offset C_15
	push 4
	call copy_arr
	push offset empty
	push offset C_16
	push 4
	call copy_arr
	push offset empty
	push offset D_1
	push 4
	call copy_arr
	push offset empty
	push offset D_2
	push 4
	call copy_arr
	push offset empty
	push offset D_3
	push 4
	call copy_arr
	push offset empty
	push offset D_4
	push 4
	call copy_arr
	push offset empty
	push offset D_5
	push 4
	call copy_arr
	push offset empty
	push offset D_6
	push 4
	call copy_arr
	push offset empty
	push offset D_7
	push 4
	call copy_arr
	push offset empty
	push offset D_8
	push 4
	call copy_arr
	push offset empty
	push offset D_9
	push 4
	call copy_arr
	push offset empty
	push offset D_10
	push 4
	call copy_arr
	push offset empty
	push offset D_11
	push 4
	call copy_arr
	push offset empty
	push offset D_12
	push 4
	call copy_arr
	push offset empty
	push offset D_13
	push 4
	call copy_arr
	push offset empty
	push offset D_14
	push 4
	call copy_arr
	push offset empty
	push offset D_15
	push 4
	call copy_arr
	push offset empty
	push offset D_16
	push 4
	call copy_arr
	push offset empty
	mov bx, offset C_D_1
	add bx, 2
	push bx
	push 8
	call copy_arr
	push offset empty
	mov bx, offset C_D_2
	add bx, 2
	push bx
	push 8
	call copy_arr
	push offset empty
	mov bx, offset C_D_3
	add bx, 2
	push bx
	push 8
	call copy_arr
	push offset empty
	mov bx, offset C_D_4
	add bx, 2
	push bx
	push 8
	call copy_arr
	push offset empty
	mov bx, offset C_D_5
	add bx, 2
	push bx
	push 8
	call copy_arr
	push offset empty
	mov bx, offset C_D_6
	add bx, 2
	push bx
	push 8
	call copy_arr
	push offset empty
	mov bx, offset C_D_7
	add bx, 2
	push bx
	push 8
	call copy_arr
	push offset empty
	mov bx, offset C_D_8
	add bx, 2
	push bx
	push 8
	call copy_arr
	push offset empty
	mov bx, offset C_D_9
	add bx, 2
	push bx
	push 8
	call copy_arr
	push offset empty
	mov bx, offset C_D_10
	add bx, 2
	push bx
	push 8
	call copy_arr
	push offset empty
	mov bx, offset C_D_11
	add bx, 2
	push bx
	push 8
	call copy_arr
	push offset empty
	mov bx, offset C_D_12
	add bx, 2
	push bx
	push 8
	call copy_arr
	push offset empty
	mov bx, offset C_D_13
	add bx, 2
	push bx
	push 8
	call copy_arr
	push offset empty
	mov bx, offset C_D_14
	add bx, 2
	push bx
	push 8
	call copy_arr
	push offset empty
	mov bx, offset C_D_15
	add bx, 2
	push bx
	push 8
	call copy_arr
	push offset empty
	mov bx, offset C_D_16
	add bx, 2
	push bx
	push 8
	call copy_arr
	push offset empty
	push offset K_1
	push 6
	call copy_arr
	push offset empty
	push offset K_2
	push 6
	call copy_arr
	push offset empty
	push offset K_3
	push 6
	call copy_arr
	push offset empty
	push offset K_4
	push 6
	call copy_arr
	push offset empty
	push offset K_5
	push 6
	call copy_arr
	push offset empty
	push offset K_6
	push 6
	call copy_arr
	push offset empty
	push offset K_7
	push 6
	call copy_arr
	push offset empty
	push offset K_8
	push 6
	call copy_arr
	push offset empty
	push offset K_9
	push 6
	call copy_arr
	push offset empty
	push offset K_10
	push 6
	call copy_arr
	push offset empty
	push offset K_11
	push 6
	call copy_arr
	push offset empty
	push offset K_12
	push 6
	call copy_arr
	push offset empty
	push offset K_13
	push 6
	call copy_arr
	push offset empty
	push offset K_14
	push 6
	call copy_arr
	push offset empty
	push offset K_15
	push 6
	call copy_arr
	push offset empty
	push offset K_16
	push 6
	call copy_arr
	push offset empty
	push offset IP_data
	push 8
	call copy_arr
	push offset empty
	push offset L_0
	push 4
	call copy_arr
	push offset empty
	push offset R_0
	push 4
	call copy_arr
	push offset empty
	push offset L_1
	push 4
	call copy_arr
	push offset empty
	push offset L_1_00
	push 6
	call copy_arr
	push offset empty
	push offset E_R_0
	push 6
	call copy_arr
	push offset empty
	push offset S_1
	push 4
	call copy_arr
	push offset empty
	push offset S_1_00
	push 6
	call copy_arr
	push offset empty
	push offset R_1
	push 4
	call copy_arr
	push offset empty
	push offset L_2
	push 4
	call copy_arr
	push offset empty
	push offset L_2_00
	push 6
	call copy_arr
	push offset empty
	push offset E_R_1
	push 6
	call copy_arr
	push offset empty
	push offset S_2
	push 4
	call copy_arr
	push offset empty
	push offset S_2_00
	push 6
	call copy_arr
	push offset empty
	push offset R_2
	push 4
	call copy_arr
	push offset empty
	push offset L_3
	push 4
	call copy_arr
	push offset empty
	push offset L_3_00
	push 6
	call copy_arr
	push offset empty
	push offset E_R_2
	push 6
	call copy_arr
	push offset empty
	push offset S_3
	push 4
	call copy_arr
	push offset empty
	push offset S_3_00
	push 6
	call copy_arr
	push offset empty
	push offset R_3
	push 4
	call copy_arr
	push offset empty
	push offset L_4
	push 4
	call copy_arr
	push offset empty
	push offset L_4_00
	push 6
	call copy_arr
	push offset empty
	push offset E_R_3
	push 6
	call copy_arr
	push offset empty
	push offset S_4
	push 4
	call copy_arr
	push offset empty
	push offset S_4_00
	push 6
	call copy_arr
	push offset empty
	push offset R_4
	push 4
	call copy_arr
	push offset empty
	push offset L_5
	push 4
	call copy_arr
	push offset empty
	push offset L_5_00
	push 6
	call copy_arr
	push offset empty
	push offset E_R_4
	push 6
	call copy_arr
	push offset empty
	push offset S_5
	push 4
	call copy_arr
	push offset empty
	push offset S_5_00
	push 6
	call copy_arr
	push offset empty
	push offset R_5
	push 4
	call copy_arr
	push offset empty
	push offset L_6
	push 4
	call copy_arr
	push offset empty
	push offset L_6_00
	push 6
	call copy_arr
	push offset empty
	push offset E_R_5
	push 6
	call copy_arr
	push offset empty
	push offset S_6
	push 4
	call copy_arr
	push offset empty
	push offset S_6_00
	push 6
	call copy_arr
	push offset empty
	push offset R_6
	push 4
	call copy_arr
	push offset empty
	push offset L_7
	push 4
	call copy_arr
	push offset empty
	push offset L_7_00
	push 6
	call copy_arr
	push offset empty
	push offset E_R_6
	push 6
	call copy_arr
	push offset empty
	push offset S_7
	push 4
	call copy_arr
	push offset empty
	push offset S_7_00
	push 6
	call copy_arr
	push offset empty
	push offset R_7
	push 4
	call copy_arr
	push offset empty
	push offset L_8
	push 4
	call copy_arr
	push offset empty
	push offset L_8_00
	push 6
	call copy_arr
	push offset empty
	push offset E_R_7
	push 6
	call copy_arr
	push offset empty
	push offset S_8
	push 4
	call copy_arr
	push offset empty
	push offset S_8_00
	push 6
	call copy_arr
	push offset empty
	push offset R_8
	push 4
	call copy_arr
	push offset empty
	push offset L_9
	push 4
	call copy_arr
	push offset empty
	push offset L_9_00
	push 6
	call copy_arr
	push offset empty
	push offset E_R_8
	push 6
	call copy_arr
	push offset empty
	push offset S_9
	push 4
	call copy_arr
	push offset empty
	push offset S_9_00
	push 6
	call copy_arr
	push offset empty
	push offset R_9
	push 4
	call copy_arr
	push offset empty
	push offset L_10
	push 4
	call copy_arr
	push offset empty
	push offset L_10_00
	push 6
	call copy_arr
	push offset empty
	push offset E_R_9
	push 6
	call copy_arr
	push offset empty
	push offset S_10
	push 4
	call copy_arr
	push offset empty
	push offset S_10_00
	push 6
	call copy_arr
	push offset empty
	push offset R_10
	push 4
	call copy_arr
	push offset empty
	push offset L_11
	push 4
	call copy_arr
	push offset empty
	push offset L_11_00
	push 6
	call copy_arr
	push offset empty
	push offset E_R_10
	push 6
	call copy_arr
	push offset empty
	push offset S_11
	push 4
	call copy_arr
	push offset empty
	push offset S_11_00
	push 6
	call copy_arr
	push offset empty
	push offset R_11
	push 4
	call copy_arr
	push offset empty
	push offset L_12
	push 4
	call copy_arr
	push offset empty
	push offset L_12_00
	push 6
	call copy_arr
	push offset empty
	push offset E_R_11
	push 6
	call copy_arr
	push offset empty
	push offset S_12
	push 4
	call copy_arr
	push offset empty
	push offset S_12_00
	push 6
	call copy_arr
	push offset empty
	push offset R_12
	push 4
	call copy_arr
	push offset empty
	push offset L_13
	push 4
	call copy_arr
	push offset empty
	push offset L_13_00
	push 6
	call copy_arr
	push offset empty
	push offset E_R_12
	push 6
	call copy_arr
	push offset empty
	push offset S_13
	push 4
	call copy_arr
	push offset empty
	push offset S_13_00
	push 6
	call copy_arr
	push offset empty
	push offset R_13
	push 4
	call copy_arr
	push offset empty
	push offset L_14
	push 4
	call copy_arr
	push offset empty
	push offset L_14_00
	push 6
	call copy_arr
	push offset empty
	push offset E_R_13
	push 6
	call copy_arr
	push offset empty
	push offset S_14
	push 4
	call copy_arr
	push offset empty
	push offset S_14_00
	push 6
	call copy_arr
	push offset empty
	push offset R_14
	push 4
	call copy_arr
	push offset empty
	push offset L_15
	push 4
	call copy_arr
	push offset empty
	push offset L_15_00
	push 6
	call copy_arr
	push offset empty
	push offset E_R_14
	push 6
	call copy_arr
	push offset empty
	push offset S_15
	push 4
	call copy_arr
	push offset empty
	push offset S_15_00
	push 6
	call copy_arr
	push offset empty
	push offset R_15
	push 4
	call copy_arr
	push offset empty
	push offset L_16
	push 4
	call copy_arr
	push offset empty
	push offset L_16_00
	push 6
	call copy_arr
	push offset empty
	push offset E_R_15
	push 6
	call copy_arr
	push offset empty
	push offset S_16
	push 4
	call copy_arr
	push offset empty
	push offset S_16_00
	push 6
	call copy_arr
	push offset empty
	push offset R_16
	push 4
	call copy_arr
	push offset empty
	push offset R16_L16
	push 8
	call copy_arr
	popa
	ret
endp clean_data
; --------------------------------------------- DES3_Encryption ---------------------------------------------
;
;
; --------------------------------------------- DES3_Encryption ---------------------------------------------
proc DES3_Encryption
; get keys and data
	push offset between_prints
	call printstring
	push offset msg_DES3
	call printstring
	push offset input_data
	call readstring
	push offset dollar
	call printstring
	push offset between_prints
	call printstring
	push offset blank
	call printstring
	push offset between_prints
	call printstring
	push offset msg_DES3_K1
	call printstring
	push offset input_key
	call readstring
	push offset dollar
	call printstring
	push offset between_prints
	call printstring
	push offset blank
	call printstring
	push offset between_prints
	call printstring
	push offset msg_DES3_K2
	call printstring
	push offset input_key_2
	call readstring
	push offset dollar
	call printstring
	push offset between_prints
	call printstring
	push offset blank
	call printstring
; encryption with key 1
	call DES_Encryption
; organizing for the decryption
	mov bx, offset input_key
	add bx, 2
	push bx
	mov bx, offset temp_key
	add bx, 2
	push bx
	push 8
	call copy_arr
	mov bx, offset input_key_2
	add bx, 2
	push bx
	mov bx, offset input_key
	add bx, 2
	push bx
	push 8
	call copy_arr
	push offset Encrypted_Data
	mov bx, offset input_data
	add bx, 2
	push bx
	push 8
	call copy_arr
	call clean_data
	push offset empty
	push offset Encrypted_Data
	push 8
	call copy_arr
; decryption with key 2
	call DES_Decryption
; organizing for the encryption
	mov bx, offset temp_key
	add bx, 2
	push bx
	mov bx, offset input_key
	add bx, 2
	push bx
	push 8
	call copy_arr
	push offset Decrypted_Data
	mov bx, offset input_data
	add bx, 2
	push bx
	push 8
	call copy_arr
	call clean_data
	push offset empty
	push offset Decrypted_Data
	push 8
	call copy_arr
; encryption with key 1
	call DES_Encryption
; finish masseges and output
	push offset between_prints
	call printstring
	push offset finish_msg
	call printstring
	push offset Encrypted_Data
	push 8
	call hex_to_ascii
	push offset dollar
	call printstring
	push offset between_prints
	call printstring
	push offset blank
	call printstring
	ret
endp DES3_Encryption
; --------------------------------------------- DES3_Decryption ---------------------------------------------
;
;
; --------------------------------------------- DES3_Decryption ---------------------------------------------
proc DES3_Decryption
; get 2 keys and encrypted data
	push offset between_prints
	call printstring
	push offset msg_DES3_Decryption
	call printstring
	push offset input_Encrypted_data
	call readstring
	push offset dollar
	call printstring
	push offset between_prints
	call printstring
	push offset blank
	call printstring
	push offset between_prints
	call printstring
	push offset msg2_DES3_Decryption
	call printstring
	push offset input_key
	call readstring
	push offset dollar
	call printstring
	push offset between_prints
	call printstring
	push offset blank
	call printstring
	push offset between_prints
	call printstring
	push offset msg3_DES3_Decryption
	call printstring
	push offset input_key_2
	call readstring
	push offset dollar
	call printstring
	push offset between_prints
	call printstring
	push offset blank
	call printstring
;THE ENCRYPTED DATA IS INPUTED AS ASCII SO WE NEED TO CONVERT IT FROM ASCII CHARS TO HEX VALUE
	mov bx, offset input_data
	add bx, 2
	push bx
	mov bx, offset input_Encrypted_data
	add bx, 2
	push bx
	push 8
	call ascii_to_hex
; decryption with key 1
	call DES_Decryption
; organizing for the encryption
	mov bx, offset input_key
	add bx, 2
	push bx
	mov bx, offset temp_key
	add bx, 2
	push bx
	push 8
	call copy_arr
	mov bx, offset input_key_2
	add bx, 2
	push bx
	mov bx, offset input_key
	add bx, 2
	push bx
	push 8
	call copy_arr
	push offset Decrypted_Data
	mov bx, offset input_data
	add bx, 2
	push bx
	push 8
	call copy_arr
	call clean_data
	push offset empty
	push offset Decrypted_Data
	push 8
	call copy_arr
; decryption with key 2
	call DES_Encryption
; organizing for the decryption
	mov bx, offset temp_key
	add bx, 2
	push bx
	mov bx, offset input_key
	add bx, 2
	push bx
	push 8
	call copy_arr
	push offset Encrypted_Data
	mov bx, offset input_data
	add bx, 2
	push bx
	push 8
	call copy_arr
	call clean_data
	push offset empty
	push offset Encrypted_Data
	push 8
	call copy_arr
; decryption with key 1
	call DES_Decryption
; finish masseges and output
	push offset between_prints
	call printstring
	push offset finish_msg_Decryption
	call printstring
	push offset Decrypted_Data
	call printstring
	push offset dollar
	call printstring
	push offset between_prints
	call printstring
	push offset blank
	call printstring
	ret
endp DES3_Decryption
; --------------------------------------------- START ---------------------------------------------
start:
	mov ax, @data
	mov ds, ax
; --------------------------
; Your code here
what_to_do_Invalid:
	push offset between_prints
	call printstring
	push offset msg_mode
	call printstring
	push offset what_to_do
	call readstring
	push offset dollar
	call printstring
	push offset between_prints
	call printstring
	push offset blank
	call printstring
	mov al, [byte ptr what_to_do + 2]
	cmp al, "3"
	je CALL_DES3
	mov al, [byte ptr what_to_do + 2]
	cmp al, "1"
	je CALL_DES
	mov al, [byte ptr what_to_do + 2]
	cmp al, "E"
	jne Invalid
	mov al, [byte ptr what_to_do + 3]
	cmp al, "X"
	je exit
	jmp Invalid
CALL_DES3:
	mov al, [byte ptr what_to_do + 3]
	cmp al, "E"
	je CALL_DES3_Encryption
	call DES3_Decryption
	jmp exit
CALL_DES3_Encryption:
	call DES3_Encryption
	jmp exit
	
CALL_DES:
	mov al, [byte ptr what_to_do + 3]
	cmp al, "E"
	je CALL_DES_Encryption
	call DES_DECRYPTION
	jmp exit
CALL_DES_Encryption:
	call DES_Encryption
	jmp exit
Invalid:
	push offset between_prints
	call printstring
	push offset msg_Invalid
	call printstring
	push offset dollar
	call printstring
	push offset between_prints
	call printstring
	push offset blank
	call printstring
	jmp what_to_do_Invalid
; --------------------------
exit:
	mov ax, 4c00h
	int 21h
END start





















