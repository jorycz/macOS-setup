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
 l     ��������  ��  ��        l    : ����  O     :    k    9       l   ��������  ��  ��        O    '    k    &       I   ������
�� .miscactvnull��� ��� obj ��  ��        I   �� ��
�� .sysodelanull��� ��� nmbr  m       ?�      ��         O     ! " ! I   �� #��
�� .coreclosnull���     obj  # 2    ��
�� 
cwin��   " m     $ $�                                                                                  MACS  alis    @  Macintosh HD               �y��BD ����
Finder.app                                                     �����y��        ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��      %�� % I  ! &�� &��
�� .sysodelanull��� ��� nmbr & m   ! " ' ' ?�      ��  ��    m     ( (�                                                                                  MACS  alis    @  Macintosh HD               �y��BD ����
Finder.app                                                     �����y��        ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��     ) * ) l  ( (��������  ��  ��   *  + , + I  ( 1�� - .
�� .prcskprsnull���     ctxt - m   ( ) / / � 0 0  j . �� 1��
�� 
faal 1 J   * - 2 2  3�� 3 m   * +��
�� eMdsKcmd��  ��   ,  4 5 4 I  2 7�� 6��
�� .sysodelanull��� ��� nmbr 6 m   2 3 7 7 ?�      ��   5  8�� 8 l  8 8��������  ��  ��  ��    m      9 9�                                                                                  sevs  alis    \  Macintosh HD               �y��BD ����System Events.app                                              �����y��        ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  ��  ��     : ; : l     ��������  ��  ��   ;  < = < l  ; @ >���� > I  ; @�� ?��
�� .sysodelanull��� ��� nmbr ? m   ; < @ @ ?�333333��  ��  ��   =  A B A l     ��������  ��  ��   B  C D C l  A? E���� E O  A? F G F O   E> H I H k   L= J J  K L K l  L L��������  ��  ��   L  M N M r   L Q O P O m   L M��
�� boovtrue P 1   M P��
�� 
pisf N  Q R Q r   R \ S T S n   R X U V U 1   V X��
�� 
pnam V 4   R V�� W
�� 
cwin W m   T U����  T o      ���� 0 wname wName R  X Y X Z   ] � Z [���� Z H   ] � \ \ l  ] � ]���� ] I  ] ��� ^��
�� .coredoexnull���     **** ^ l  ] | _���� _ 6  ] | ` a ` 4  ] a�� b
�� 
cwin b m   _ `����  a l  d { c���� c F   d { d e d =  e n f g f 1   f h��
�� 
pnam g o   i m���� 0 wname wName e =  o z h i h 1   p t��
�� 
sbrl i m   u y j j � k k , A X S y s t e m F l o a t i n g W i n d o w��  ��  ��  ��  ��  ��  ��   [ k   � � l l  m n m I  � ��� o p
�� .prcskprsnull���     ctxt o m   � � q q � r r  j p �� s��
�� 
faal s J   � � t t  u�� u m   � ���
�� eMdsKcmd��  ��   n  v�� v T   � � w w k   � � x x  y z y Z  � � { |���� { I  � ��� }��
�� .coredoexnull���     **** } l  � � ~���� ~ 6  � �  �  4  � ��� �
�� 
cwin � m   � �����  � l  � � ����� � F   � � � � � =  � � � � � 1   � ���
�� 
pnam � o   � ����� 0 wname wName � =  � � � � � 1   � ���
�� 
sbrl � m   � � � � � � � , A X S y s t e m F l o a t i n g W i n d o w��  ��  ��  ��  ��   |  S   � ���  ��   z  ��� � I  � ��� ���
�� .sysodelanull��� ��� nmbr � m   � � � � ?���������  ��  ��  ��  ��   Y  � � � O   �) � � � k   �( � �  � � � r   � � � � � 4   � ��� �
�� 
popB � m   � �����  � o      ���� 0 thepopup thePopUp �  � � � I  ��� ���
�� .prcsclicnull��� ��� uiel � o   ����� 0 thepopup thePopUp��   �  � � � I �� ���
�� .sysodelanull��� ��� nmbr � m   � � ?�      ��   �  � � � I �� ���
�� .prcskprsnull���     ctxt � m   � � � � �  D a t e   c r e a t e��   �  � � � I �� ���
�� .sysodelanull��� ��� nmbr � m   � � ?�      ��   �  � � � l " � � � � I "�� ���
�� .prcskcodnull���     **** � m  ���� $��   �  ## keycode Enter    � � � �   # #   k e y c o d e   E n t e r �  ��� � I #(�� ���
�� .sysodelanull��� ��� nmbr � m  #$���� ��  ��   � l  � � ����� � 6  � � � � � 4  � ��� �
�� 
cwin � m   � �����  � l  � � ����� � F   � � � � � =  � � � � � 1   � ���
�� 
pnam � o   � ����� 0 wname wName � =  � � � � � 1   � ���
�� 
sbrl � m   � � � � � � � , A X S y s t e m F l o a t i n g W i n d o w��  ��  ��  ��   �  � � � l **��������  ��  ��   �  � � � I *5�� � �
�� .prcskprsnull���     ctxt � m  *- � � � � �  j � �� ���
�� 
faal � J  .1 � �  ��� � m  ./�
� eMdsKcmd��  ��   �  � � � I 6;�~ ��}
�~ .sysodelanull��� ��� nmbr � m  67�|�| �}   �  ��{ � l <<�z�y�x�z  �y  �x  �{   I 4   E I�w �
�w 
prcs � m   G H � � � � �  F i n d e r G m   A B � ��                                                                                  sevs  alis    \  Macintosh HD               �y��BD ����System Events.app                                              �����y��        ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  ��  ��   D  � � � l     �v�u�t�v  �u  �t   �  � � � l @G ��s�r � I @G�q ��p
�q .ascrcmnt****      � **** � m  @C � � � � �  S C R I P T   E N D .�p  �s  �r   �  ��o � l     �n�m�l�n  �m  �l  �o       �k � � � ��j�k   � �i�h�g�f
�i .aevtoappnull  �   � ****�h 0 wname wName�g 0 thepopup thePopUp�f   � �e ��d�c � ��b
�e .aevtoappnull  �   � **** � k    G � �   � �  < � �  C � �  ��a�a  �d  �c   �   � " 9 (�` �_�^�] /�\�[�Z @�Y ��X�W�V ��U j�T q � � ��S�R�Q ��P�O � ��N
�` .miscactvnull��� ��� obj 
�_ .sysodelanull��� ��� nmbr
�^ 
cwin
�] .coreclosnull���     obj 
�\ 
faal
�[ eMdsKcmd
�Z .prcskprsnull���     ctxt
�Y 
prcs
�X 
pisf
�W 
pnam�V 0 wname wName �  
�U 
sbrl
�T .coredoexnull���     ****
�S 
popB�R 0 thepopup thePopUp
�Q .prcsclicnull��� ��� uiel�P $
�O .prcskcodnull���     ****
�N .ascrcmnt****      � ****�bH� 7�  *j O�j O� 	*�-j UO�j UO���kvl 
O�j OPUO�j O� �*��/ �e*�,FO*�k/�,E` O*�k/a [[�,\Z_ 8\[a ,\Za 8A1j  Na ��kvl 
O <hZ*�k/a [[�,\Z_ 8\[a ,\Za 8A1j  Y hOa j [OY��Y hO*�k/a [[�,\Z_ 8\[a ,\Za 8A1 6*a l/E` O_ j O�j Oa j 
O�j Oa j Okj UOa ��kvl 
Okj OPUUOa  j ! � � � �  D e s k t o p �  � �  ��M � �  ��L � �  9�K �
�K 
pcap � � � �  F i n d e r
�L 
cwin � � � �  D e s k t o p
�M 
popB � � � �  S o r t   B y :�j  ascr  ��ޭ