Vim�UnDo� �{�N�$����ǍtH�'`qu^���z�J   3              /         &       &   &   &    S|�    _�                             ����                                                                                                                                                                                                                                                                                                                                                             S{�     �                 *    Description:  <CURSOR>�                   �               5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             S{�	     �                 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             S{�	     �                #include <stdlib.h>5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             S{�
     �                  �               5�_�                       
    ����                                                                                                                                                                                                                                                                                                                               
                 v       S{�     �                 Inc�                 #include <.h>5�_�                       
    ����                                                                                                                                                                                                                                                                                                                               
                 v       S{�     �               !    virtual ~${1/(\w+).*/$1/} ();�               &    ${1/(\w+).*/$1/} (${2:arguments});�               1class ${1:`!p snip.rv = snip.basename or "name"`}�                   ${0:/* data */}�                 cl�                 #include <.h>5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                v       S{�2     �                   virtual ~pthread ();�                   pthread (arguments);�               class pthread5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                                                V       S{�>     �                class myclass   {   public:       myclass (arguments);       virtual ~myclass ();       private:       /* data */5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                V       S{�>     �                };5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                                V       S{�?     �                  �               5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       S{�R     �               	    for()�                   �             �                 void thread(void)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       S{�a     �                       cout<<""�                   for(i=0;i<3;i++)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       S{�j     �                       cout<<"thread run"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       S{�w     �                    ${0:/* code */}�                 main�                 }5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       S{�{     �      !   "          ret = pthread_create()�      !              /* code */5�_�                        1    ����                                                                                                                                                                                                                                                                                                                                                v       S{��     �       "   #          if()�      "   "      1    ret = pthread_create(&id, NULL, thread, NULL)5�_�                    !       ����                                                                                                                                                                                                                                                                                                                                                v       S{��     �       #   #          if(ret != 0)5�_�                    "       ����                                                                                                                                                                                                                                                                                                                                                v       S{��     �   "   $   &              �   "   $   %    �   !   $   $          {}5�_�                    #       ����                                                                                                                                                                                                                                                                                                                                                v       S{��     �   #   %   '              exit()�   "   %   &              cout<<"fail"5�_�                    $       ����                                                                                                                                                                                                                                                                                                                                                v       S{��     �   #   %   '              exit(1)5�_�                   %       ����                                                                                                                                                                                                                                                                                                                                                v       S{��     �   '   )   +              �   '   )   *    �   %   )   (          �   %   '   '    5�_�                    (       ����                                                                                                                                                                                                                                                                                                                                                v       S{��     �   '   )   +              cout<<"success"5�_�                    )       ����                                                                                                                                                                                                                                                                                                                                                v       S{�     �   )   +   ,      	    for()�   (   +   +          }5�_�                    *       ����                                                                                                                                                                                                                                                                                                                                                v       S{�     �   *   ,   -              cout<<""�   )   ,   ,          for(i=0;i<3;i++)5�_�                    +       ����                                                                                                                                                                                                                                                                                                                                                v       S{�    �   *   ,   -              cout<<"main thread"5�_�                    +   !    ����                                                                                                                                                                                                                                                                                                                                                v       S{�     �   +   -   .          �   +   -   -    5�_�                    ,       ����                                                                                                                                                                                                                                                                                                                                                v       S{�9    �   +   .   .          pthread_join(id, NULL)5�_�                    (        ����                                                                                                                                                                                                                                                                                                                                                             S|�     �   (   *   0              �   (   *   /    5�_�                     )       ����                                                                                                                                                                                                                                                                                                                                                             S|�     �   (   *   0              sleep(1)5�_�      !                      ����                                                                                                                                                                                                                                                                                                                                                             S|�     �         1          �         0    5�_�       "           !          ����                                                                                                                                                                                                                                                                                                                                                             S|�    �         1              sleep(2)5�_�   !   #           "   *       ����                                                                                                                                                                                                                                                                                                                                                             S|�     �   )   *                  sleep(1);5�_�   "   $           #   ,       ����                                                                                                                                                                                                                                                                                                                                                             S|�     �   ,   .   0    �   ,   -   0    5�_�   #   %           $   +       ����                                                                                                                                                                                                                                                                                                                                                             S|�     �   +   -   2              �   +   -   1    5�_�   $   &           %   ,       ����                                                                                                                                                                                                                                                                                                                                                             S|�     �   +   -   2          {}5�_�   %               &   .       ����                                                                                                                                                                                                                                                                                                                                                             S|�    �   .   0   3              �   .   0   2    5�_�                    %       ����                                                                                                                                                                                                                                                                                                                                                v       S{��     �   $   &   '          }   	    else{       }�   &   (   )          }O5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             S{�     �              5��