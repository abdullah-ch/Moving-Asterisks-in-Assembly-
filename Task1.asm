[org 0x0100]            
jmp  start 

Moving_Asterik :
    push ax
    push es 
    push di
    push si

    mov  ax, 0xb800                                                    
    mov  es, ax              
    mov  di, 0
    mov  si, 160        


    mov_Next_Asterik:
    mov word [es: di] , 0x072A
    mov word [es: si] , 0x072A
    add di, 2
    sub si, 2 


    mov cx , 0xFFFF
    push cx
    here: loop here
    mov cx , 0xFFFF
    here_2: loop here_2
    pop cx
    
    call CLEARSCREEN
    cmp di , 76    
    jne mov_Next_Asterik

    mov_Next_two_Asterik:
    mov word [es: di] , 0x072A
    mov word [es: si] , 0x072A
    sub di, 2
    add si, 2 


    mov cx , 0xFFFF
    push cx
    here_3: loop here_3
    mov cx , 0xFFFF
    here_4: loop here_4
    pop cx
    
    call CLEARSCREEN
    cmp di , 0   
    jne mov_Next_two_Asterik

    pop si
    pop di
    pop es
    pop ax

    ret

 

CLEARSCREEN :
    push ax
    push es 
    push di

 

ADDING_SPACING:

   
    mov  ax, 0xb800        
    mov  es, ax            
    mov  di, 0              
 
mov_Next_CHAR:     mov  word [es:di], 0x0720        
    add  di, 2                       
    cmp  di, 2000               
    jne  mov_Next_CHAR           

    pop di
    pop es
    pop ax

    ret

    start : 
   mov cx , 0xFFFF
   here_9 : call Moving_Asterik
    loop here_9
    ; call CLEARSCREEN

    EXIT :
    mov  ax, 0x4c00                
    int  0x21