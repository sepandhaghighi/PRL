$regfile = "m32def.dat"
$crystal = 1000000
$baud = 600

Config Serialout = Buffered , Size = 40
Enable Interrupts
Enable Int0


On Int0 Label1


Do

  NOP
Loop


End


Label1:

Print "Test"

Return