Dim speaks, speech
hour_now=hour(time)
speaks="It is " & hour_now & " o clock " & ", It is " & hour_now & " o clock "
Set speech=CreateObject("sapi.spvoice")
speech.Speak speaks