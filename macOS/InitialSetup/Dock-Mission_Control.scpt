FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ��
### This piece of code is to identify all UI elements inside any other (window, group, scroll area, ...)
repeat with x in UI elements
	log class of x & name of x
end repeat

### This piece of code is to identify all UI elements with properties inside any other
repeat with x in UI elements
	set props to get properties of x
	log props
	log "----------------------------"
end repeat

### RUN Apple Script from Terminal: osascript YourScript.scpt
     � 	 	| 
 # # #   T h i s   p i e c e   o f   c o d e   i s   t o   i d e n t i f y   a l l   U I   e l e m e n t s   i n s i d e   a n y   o t h e r   ( w i n d o w ,   g r o u p ,   s c r o l l   a r e a ,   . . . ) 
 r e p e a t   w i t h   x   i n   U I   e l e m e n t s 
 	 l o g   c l a s s   o f   x   &   n a m e   o f   x 
 e n d   r e p e a t 
 
 # # #   T h i s   p i e c e   o f   c o d e   i s   t o   i d e n t i f y   a l l   U I   e l e m e n t s   w i t h   p r o p e r t i e s   i n s i d e   a n y   o t h e r 
 r e p e a t   w i t h   x   i n   U I   e l e m e n t s 
 	 s e t   p r o p s   t o   g e t   p r o p e r t i e s   o f   x 
 	 l o g   p r o p s 
 	 l o g   " - - - - - - - - - - - - - - - - - - - - - - - - - - - - " 
 e n d   r e p e a t 
 
 # # #   R U N   A p p l e   S c r i p t   f r o m   T e r m i n a l :   o s a s c r i p t   Y o u r S c r i p t . s c p t 
   
  
 l     ��������  ��  ��        l     ����  r         I    �� ��
�� .sysoexecTEXT���     TEXT  m        �   � d e f a u l t s   r e a d   c o m . a p p l e . s p a c e s   |   a w k   ' / S p a c e s   = / , / \ ) ; / '   |   g r e p   M a n a g e d S p a c e I D   |   w c   - l   |   t r   - d   '   '��    o      ���� 0 spacescount spacesCount��  ��        l     ��  ��      log spacesCount     �       l o g   s p a c e s C o u n t      l     ��������  ��  ��        l   � ����  Z    �  ��    ?     ! " ! o    	���� 0 spacescount spacesCount " m   	 
����   I   �� #��
�� .ascrcmnt****      � **** # m     $ $ � % % F - - - >   M o r e   S p a c e s   a v a i l a b l e   a l r e a d y .��  ��     k    � & &  ' ( ' I   �� )��
�� .sysoexecTEXT���     TEXT ) m     * * � + + 2 o p e n   - a   ' M i s s i o n   C o n t r o l '��   (  , - , I   !�� .��
�� .sysodelanull��� ��� nmbr . m     / / ?�      ��   -  0 1 0 l  " "��������  ��  ��   1  2 3 2 O   " � 4 5 4 k   & � 6 6  7 8 7 r   & 5 9 : 9 n   & 3 ; < ; 4   0 3�� =
�� 
uiel = m   1 2 > > � ? ?  S p a c e s   B a r < n   & 0 @ A @ 4   - 0�� B
�� 
uiel B m   . /����  A n   & - C D C 4   * -�� E
�� 
sgrp E m   + ,����  D 4   & *�� F
�� 
prcs F m   ( ) G G � H H  D o c k : o      ���� 0 spacebar spaceBar 8  I J I I  6 S�� K��
�� .prcsclicnull��� ��� uiel K n   6 O L M L l  7 O N���� N 6  7 O O P O 2   7 9��
�� 
butT P =  < N Q R Q n   = H S T S 1   D H��
�� 
valL T 4   = D�� U
�� 
attr U m   @ C V V � W W  A X D e s c r i p t i o n R m   I M X X � Y Y  a d d   d e s k t o p��  ��   M o   6 7���� 0 spacebar spaceBar��   J  Z [ Z I  T Y�� \��
�� .sysodelanull��� ��� nmbr \ m   T U ] ] ?�      ��   [  ^ _ ^ I  Z w�� `��
�� .prcsclicnull��� ��� uiel ` n   Z s a b a l  [ s c���� c 6  [ s d e d 2   [ ]��
�� 
butT e =  ` r f g f n   a l h i h 1   h l��
�� 
valL i 4   a h�� j
�� 
attr j m   d g k k � l l  A X D e s c r i p t i o n g m   m q m m � n n  a d d   d e s k t o p��  ��   b o   Z [���� 0 spacebar spaceBar��   _  o p o I  x }�� q��
�� .sysodelanull��� ��� nmbr q m   x y r r ?�      ��   p  s t s I  ~ ��� u��
�� .prcsclicnull��� ��� uiel u n   ~ � v w v l   � x���� x 6   � y z y 2    ���
�� 
butT z =  � � { | { n   � � } ~ } 1   � ���
�� 
valL ~ 4   � ��� 
�� 
attr  m   � � � � � � �  A X D e s c r i p t i o n | m   � � � � � � �  a d d   d e s k t o p��  ��   w o   ~ ���� 0 spacebar spaceBar��   t  � � � I  � ��� ���
�� .sysodelanull��� ��� nmbr � m   � � � � ?�      ��   �  ��� � I  � ��� ���
�� .prcsclicnull��� ��� uiel � n   � � � � � l  � � ����� � 6  � � � � � 2   � ���
�� 
butT � =  � � � � � n   � � � � � 1   � ���
�� 
valL � 4   � ��� �
�� 
attr � m   � � � � � � �  A X D e s c r i p t i o n � m   � � � � � � �  a d d   d e s k t o p��  ��   � o   � ����� 0 spacebar spaceBar��  ��   5 m   " # � ��                                                                                  sevs  alis    \  Macintosh HD               �y��BD ����System Events.app                                              �����y��        ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   3  � � � l  � ���������  ��  ��   �  � � � I  � ��� ���
�� .sysodelanull��� ��� nmbr � m   � � � � ?�      ��   �  ��� � I  � ��� ���
�� .sysoexecTEXT���     TEXT � m   � � � � � � � 2 o p e n   - a   ' M i s s i o n   C o n t r o l '��  ��  ��  ��     � � � l     ��������  ��  ��   �  � � � l  � � ����� � I  � ��� ���
�� .ascrcmnt****      � **** � m   � � � � � � �  S C R I P T   E N D .��  ��  ��   �  ��� � l     ��������  ��  ��  ��       �� � ���   � ��
�� .aevtoappnull  �   � **** � �� ����� � ���
�� .aevtoappnull  �   � **** � k     � � �   � �   � �  �����  ��  ��   �   �  ���� $�� * /�� ��� G���� >���� ��� V�� X�� k m � � � � � �
�� .sysoexecTEXT���     TEXT�� 0 spacescount spacesCount
�� .ascrcmnt****      � ****
�� .sysodelanull��� ��� nmbr
�� 
prcs
�� 
sgrp
�� 
uiel�� 0 spacebar spaceBar
�� 
butT �  
�� 
attr
�� 
valL
�� .prcsclicnull��� ��� uiel�� ��j E�O�m 
�j Y ��j O�j O� �*��/�k/�k/��/E�O��-a [a a /a ,\Za 81j O�j O��-a [a a /a ,\Za 81j O�j O��-a [a a /a ,\Za 81j O�j O��-a [a a /a ,\Za 81j UO�j Oa j Oa j  ascr  ��ޭ