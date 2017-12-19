#!/bin/bash
DATE=$(date +%Y-%m-%d-%H%M%S)
HOST=$(hostname)
LICENSE=$(date +%Y)
AUTOR=$USER
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
WHITE=$(tput setaf 9)
echo "
   C-GENERATOR (c)2012 Nico-Anders

   Hallo und herzlich Willkommen, $USER.

   Mit dem C-Generator erzeugen Sie schnell
   und bequem Codegerüste in C und ersparen
   sich die mühselige und fehleranfällige
   Programmierung der Standard-Funktionen.

   Viel Spaß!

   Drücken Sie die Enter-Taste."
read
clear
echo "
   C-GENERATOR (c)2012 Nico-Anders"
echo -n "
   Dateiname : "
read PROGRAM
echo -n "
   Menüpunkte: "
read x
clear
echo "
   C-GENERATOR (c)2012 Nico-Anders"
echo $BLUE
PS3=$WHITE'
   Auswahl: '
optionen=("stdlib.h" "string.h" "math.h" "time.h" "stdarg.h" "stddef.h"
          "ctype.h" "float.h" "limits.h" "locale.h" "signal.h" "setjmp.h"
          "errno.h" "assert.h" "mylib.h" "weiter")
select opt in "${optionen[@]}"
do
    case $opt in
        "stdlib.h")
         a="#include <stdlib.h>                                /* Nuetzliche Funktionen */"
            ;;
        "string.h")
         b="#include <string.h> 		                  /* Zeichenkettenoperationen */"
            ;;
        "math.h")
         c="#include <math.h>   		                  /* Mathematische Funktionen */"
            ;;
        "time.h")
         d="#include <time.h>                                      /* Datum und Uhrzeit */"
            ;;
        "stdarg.h")
         e="#include <stdarg.h>                          /* Variable Parameteruebergabe */"
            ;;
        "stddef.h")
         f="#include <stddef.h>                                    /* Standard-Datentyp */"
            ;;
        "ctype.h")
         g="#include <ctype.h>                         /* Zeichentest und Konvertierung */"
            ;;
        "float.h")
         h="#include <float.h>                    /* Eigenschaften fuer Gleitpunkttypen */"
            ;;
        "limits.h")
         i="#include <limits.h>                           /* Implementierungskonstanten */"
            ;;
        "locale.h")
         j="#include <locale.h>                     /* Laenderspezifische Eigenschaften */"
            ;;
        "signal.h")
         k="#include <signal.h>                                              /* Signale */"
            ;;
        "setjmp.h")
         l="#include <setjmp.h>                                  /* Unbedingte Spruenge */"
            ;;
        "errno.h")
         m="#include <errno.h>                                           /* Fehlercodes */"
            ;;
        "assert.h")
         n="#include <assert.h>                            /* Fehlersuche und Debugging */"
            ;;
         "mylib.h")
         LIBARY="#include \"./mylib_"$DATE""".h""\"""        /* Eigene Funktionsbibliothek */"
         echo "/** Funktion : Eigene Funktion fuer getch ohne Zeilenvorschub
  * Status   : fertig
  */
  #ifdef __linux__
  int ctrl() 
  {
      static int ch = -1, fd = 0;
      struct termios neu, alt;
      fd = fileno(stdin);
      tcgetattr(fd, &alt);
      neu = alt;
      neu.c_lflag &= ~(ICANON|ECHO);
      tcsetattr(fd, TCSANOW, &neu);
      ch = getchar();
      tcsetattr(fd, TCSANOW, &alt);
      return ch;
  }
  #elif __WIN32__ || _MSC_VER__
  #define ctrl() getch()
  #endif" > ./"mylib_"$DATE.h
            ;;       
        "weiter")
            break
            ;;
        *) echo $RED"   Keine Option";;
    esac
done
clear
echo "
   C-GENERATOR (c)2012 Nico-Anders"
echo $BLUE
PS3=$WHITE'
   Auswahl: '
optionen=("switch-case" "if-else" "for-loop" "do-while" "struct" "array" "time" "filehandle" "argc argv" "generieren")
select opt in "${optionen[@]}"
do
    case $opt in
        "switch-case")
         CASE="
      do
      {
          clr();
          csr(1,0);
          printf(\"-1- Funktion 1\n\");
          printf(\"-0- Beenden\n\");
          printf(\"--> Eingabe: \");
          scanf(\"%i\", &iEingabe);
          flush();
          switch(iEingabe)
          {
              case 1:
              {
                  printf(\"Funktion 1 ausfuehren\n\");
                  break;
              }
              case 0:
              {
                  printf(\"beende Programm\n\");
                  break;
              }
              default:
              {
                  printf(\"Falsche Taste!\n\");
                  wait();
                  break;
              }
          }
      }while(iEingabe != 0);"
      PARAM="SwitchCase"
      INPUT="int iEingabe = 0;"
            ;;
        "if-else")
            IF="
      do
      {
          clr();
          csr(1,0);
          printf(\"-1- Funktion 1\n\");
          printf(\"-0- Beenden   \n\");
          printf(\"--> Eingabe: \");
          scanf(\"%i\", &iEingabe);
          flush();
          if(iEingabe ==1)
          {
              printf(\"Funktion 1 ausfuehren\n\");
          }
          else if(iEingabe == 0)
          {
              printf(\"beende Programm\n\");
          }
          else
          {
              printf(\"Falsche Taste!\n\");
              wait();
          }
      }while(iEingabe != 0);"
      PARAM="IfElse"
      INPUT=" int iEingabe = 0;"
            ;;
        "for-loop")
            FOR="
      for(i = 1; i <= 5; i++)
      {
          printf(\"%2d.Schleifendurchlauf\n\", i);
      }"
      PARAM="ForLoop"
      VAR="int i = 5;"
            ;;
        "do-while")
            DO="
      while(0 < i)
      {
          printf(\"%i\n\", i);
          i--;
      }
      do
      {
          printf(\"%i\n\", i);
      }while(i != 5);"
      PARAM="DoWhile"
      VAR="int i = 5;"
            ;;
      "struct")
       STRUCT="

/** struct example
  */
  struct example
  {
      char sVar[255];
  };"
  STR=" struct example stStruct[0];
      scanf(\"%[^\n]\",stStruct[5].sVar);
      flush();
      printf(\"%s\",stStruct[5].sVar);"
  PARAM="Struct"
            ;;
      "array")
       ARR="
     int iSpalte = 0;
     int iZeile  = 0;
     int iMatrix[3][3]={{0,1,2},
                        {3,4,5},
                        {6,7,8}};
     for(iSpalte=0; iSpalte < 3; iSpalte++)
     {
		 for(iZeile=0; iZeile < 3; iZeile++)
		 {
             printf(\"%i \",iMatrix[iSpalte][iZeile]);
         }
         printf(\"\n\");
     }"
     PARAM="Array" 
            ;;        
       "time")
       TIME="
      time_t t;
      time(&t);
      srand(time(NULL));
      i = rand() %100;
      printf(\"%s\", ctime(&t));
      printf(\"%i\", i);
      #ifdef __linux__
      usleep(10000);
      #else
      sleep(1000);
      #endif"
      PARAM="Time"
      VAR="int i = 5;"
      a="#include <stdlib.h>                                /* Nuetzliche Funktionen */"
      d="#include <time.h>                                      /* Datum und Uhrzeit */"
            ;;         
        "filehandle")
            FILE="
      char sDatei[FILENAME_MAX];
      FILE *FP;
      FP = fopen(\""$PROGRAM'_'$DATE."txt\", \"r\");
      if(FP != NULL)
      {
          while(!feof(FP))
          {
              printf(\"%s\", sDatei);
              fgets(sDatei, FILENAME_MAX, FP);     /* aus Datei lesen */
              #ifndef __linux__
              int  i = 0;
              i = strlen(sDatei) -1;               /* Zeilenumbruch entfernen */
              if(sDatei[i] == '\n')
              {
                  sDatei[i] = '\0';
              }
              #endif
          };
      }
      else
      {
          fprintf(stderr,\"Datei nicht gefunden!\");
          wait();
          return EXIT_FAILURE;
      }
      fclose(FP);"
      PARAM="Filehandle"
      a="#include <stdlib.h>                                /* Nuetzliche Funktionen */"
      touch $PROGRAM'_'$DATE.txt
      echo "automatically generate with c-generator" > $PROGRAM'_'$DATE.txt
            ;;
      "argc argv")
      ARG="int argc, char *argv[]"
            ;;
        "generieren")
            break
            ;;
        *) echo $RED"   Keine Option";;
    esac
done
if test ! -s ./$PROGRAM'_'$DATE.c; # -s Datei existiert und ist nicht leer
      then
echo "/** automatically generate with c-generator
  *
  * Copyright "$LICENSE" "$AUTOR" <"$HOST">
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation; either version 2 of the License, or
  * (at your option) any later version.
  *
  * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
  * along with this program; if not, write to the Free Software
  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
  * MA 02110-1301, USA.
  *" >> ./$PROGRAM'_'$DATE.c
echo "  * Programm: "$PROGRAM".c" >> ./$PROGRAM'_'$DATE.c
echo "  * Autor   : "$AUTOR >> ./$PROGRAM'_'$DATE.c
echo "  * Version : 0.1" >> ./$PROGRAM'_'$DATE.c
echo "  * Datum   : "$DATE >> ./$PROGRAM'_'$DATE.c
echo "  * Stand   : "$DATE >> ./$PROGRAM'_'$DATE.c
echo "  * Status  : in Arbeit" >> ./$PROGRAM'_'$DATE.c
echo "  * ToDo's  :" >> ./$PROGRAM'_'$DATE.c
echo "  */" >> ./$PROGRAM'_'$DATE.c

echo "
/** Praeprozessor
  * Bibliothek-Einbindung fuer Ein- und Ausgaben (scanf, printf)
  */
  #include <stdio.h>                                          /* Standard-I/O */
  ""$a""
  ""$b""
  ""$c""
  ""$d""
  ""$e""
  ""$f""
  ""$g""
  ""$h""
  ""$i""
  ""$j""
  ""$k""
  ""$l""
  ""$m""
  ""$n""
  #ifdef __linux__
  #include <termios.h>
  #include <unistd.h>
  #elif __WIN32__ || _MSC_VER__
  #include <windows.h>
  #include <conio.h>
  #endif
  ""$LIBARY""

/** Funktion : Bildschirmausgabe unter Linux und Windows stoppen
  * Status   : fertig
  */
  void wait()
  {
      #ifdef __linux__
      getchar();
      #elif __WIN32__ || _MSC_VER__
      getch();
      #endif
  }

/** Funktion: Tastaturpuffer leeren
  * Status  : fertig
  */
  void flush()
  {
      int c;
      while( ((c = getchar()) != EOF) && (c != '\n') );
  }

/** Funktion : vorherige Bildschirmausgabe unter Linux und Windows loeschen
  * Status   : fertig
  */
  void clr()
  {
      #ifdef __linux__
      printf(\"\033[1J\033[1;1H\");            /* Ausgabe loeschen und Cursor
                                              * auf 1.Zeile oben links setzen */
      #elif __WIN32__ || _MSC_VER__
      system(\"cls\");
      #endif
  }

/** Funktion : Setzt den Cursor an Position x;y
  * Status   : fertig
  */
  void csr( unsigned int y , unsigned int x )
  {
      #ifdef __linux__
      printf(\"\033[%i;%iH\" , ( y + 1 ) , ( x + 1 ) );
      #else
      COORD Position;
      Position.X = x;
      Position.Y = y;
      SetConsoleCursorPosition( GetStdHandle( STD_OUTPUT_HANDLE ), Position );
      #endif
  }""$STRUCT"" " >> ./$PROGRAM'_'$DATE.c
for x in $(seq 1 $x);
   do echo "
/** Funktion : Beschreibung der Funktion "$PARAM"_"$x"
  * Status   : in Arbeit
  */
  int i"$PARAM"_"$x"()
  {
     clr();
     csr(1,0);
    ""$STR""
    ""$ARR""
    ""$VAR""
    ""$INPUT""
	""$CASE""""$IF""""$FOR""""$DO""""$TIME""""$FILE""
      wait();
      return 0;
  }"
done >> $PROGRAM'_'$DATE.c

echo "
/** Funktion : Beschreibung der Funktion "$PROGRAM"
  * Status   : in Arbeit
  */
  int i"$PROGRAM"()
  {
      int iEingabe;
      do
      {
          clr();
          csr(1,0);">> $PROGRAM'_'$DATE.c
          for x in $(seq 1 $x);
              do echo "          printf(\""-$x-"" $PARAM $x"\n\");"
          done >> $PROGRAM'_'$DATE.c
          echo "          printf(\"-0- Beenden\n\");
          printf(\"--> Eingabe: \");
          scanf(\"%i\", &iEingabe);
          flush();
          switch(iEingabe)
          {" >> $PROGRAM'_'$DATE.c
			 for x in $(seq 1 $x);
                 do echo "              case "$x":
              {
                  i"$PARAM"_"$x"();
                  break;
              }"
              done >> $PROGRAM'_'$DATE.c
              echo "              case 0:
              {
                  return 0;
                  break;
              }
              default:
              {
                  printf(\"Falsche Taste!\");
                  wait();
                  break;
              }
          }
      }while(iEingabe != 0);
      wait();
      return 0;
  }" >> ./$PROGRAM'_'$DATE.c

echo "
/** Steuerprogramm
  */
  int iController()
  {
      i"$PROGRAM"();
      return 0; /* Sprung-Anweisung */
  }

/** Hauptprogramm
  */
  int main("$ARG")                       /* Argumentuebergabe */
  {
      iController();
      return 0;
  }

/** Programmende
  */" >> ./$PROGRAM'_'$DATE.c
  for SIGN in "/" "-" "\\" "|";
        do
        gcc -g $PROGRAM'_'$DATE.c -o $PROGRAM'_'$DATE
        clear
        echo "
   C-GENERATOR (c)2012 Nico-Anders
   "$GREEN$PROGRAM'_'$DATE.c" erfolgreich generiert!

   Vielen Dank für die Nutzung."
        sleep 1
        nano $PROGRAM'_'$DATE.c
     done
   else
      echo "
   C-GENERATOR (c)2012 Nico-Anders"
      echo $RED"
   Fehler beim anlegen der Datei" $PROGRAM'_'$DATE.c
      exit 0
fi
