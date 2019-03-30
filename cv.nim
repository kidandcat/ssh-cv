import terminal, cligen, os, strutils, asyncdispatch

#      #
# util #
#      #
proc comment(text: string): void =
  for i in countup(0, len(text)-1):
    sleep(40)
    styledWrite(stdout, fgYellow, $text[i])
    flushFile(stdout)
  sleep(500)
  for i in countdown(len(text)-1, 0):
    sleep(30)
    eraseLine()
    styledWrite(stdout, fgYellow, text[0 .. i])
    flushFile(stdout)
  eraseLine()
  sleep(300)

proc writeSlowly(text: string, color: ForegroundColor): void =
  for i in countup(0, len(text)-1):
    if text[i] == ' ':
      sleep(100)
    sleep(60)
    styledWrite(stdout, color, $text[i])
    flushFile(stdout)
  sleep(300)

proc loading(repeat: int): void =
  var sequence = ['|', '/', '-', '\\','|', '/', '-', '\\']
  for j in countup(0, repeat):
    for i in countup(0, sequence.len()-1):
      sleep(100)
      eraseLine()
      styledWrite(stdout, fgGreen, $sequence[i])
      flushFile(stdout)
  eraseLine()


#    #
# cv #
#    #
proc writeSkills(): void =
  writeSlowly("\n\nSKILLS\n", fgYellow)
  writeSlowly("#####  ", fgGreen)
  writeSlowly("ReactJS\n", fgWhite)
  writeSlowly("####   ", fgGreen)
  writeSlowly("React Native\n", fgWhite)
  writeSlowly("#####  ", fgGreen)
  writeSlowly("JavaScript\n", fgWhite)
  writeSlowly("####   ", fgGreen)
  writeSlowly("Go\n", fgWhite)
  writeSlowly("#####  ", fgGreen)
  writeSlowly("CSS\n", fgWhite)
  writeSlowly("###    ", fgGreen)
  writeSlowly("Nim", fgWhite)
  writeSlowly("  (favorite)\n", fgBlue)


proc writePersonalInfo(): void =
  writeSlowly("\nINFO\n", fgYellow)
  writeSlowly("Name: ", fgWhite)
  writeSlowly("Jairo Caro-Accino Viciana\n", fgGreen)
  writeSlowly("Year: ", fgWhite)
  writeSlowly("1993\n", fgGreen)
  writeSlowly("Location: ", fgWhite)
  writeSlowly("Spain\n", fgGreen)  


#      #
# main #
#      #
proc hello(): int =
  eraseScreen()
  loading(1)
  comment("Welcome to my interactive CV")
  loading(1)
  writePersonalInfo()
  comment("If you miss any data, write an email to me!")
  loading(1)
  writeSkills()
  comment("same than before, ask about any language or tech, if I wrote everything I know here, you would need to wait 1 hour to read it all!")
  result = 0     

dispatch(hello)
