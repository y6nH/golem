<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 128
nchnls = 2
0dbfs = 1.0

;Spiano = "piano.wav"

gifn ftgen	0, 0, 257, 9, .5, 1, 270 ; Distortion shaping function
;gipiano ftgen 0, 0, 16384, 1, Spiano, 0, 0, 0 ; Piano sample 

instr 1 ; Noise drum
	a1 pinker ; Pink noise generator
	kenv xadsr .00001, .095, .4, .5 ; Percussive ADSR envelope
	kcf = p4 ; cutoff
	kbw = p5 ; bandwidth
	ares reson a1, kenv * kcf, kbw, 1 ; Resonant filter driven by the envelope
	asig gain ares, kenv * .1 ; Envelope also drives the gain
	outs asig, asig

endin

instr 2 ; Buzz synth
	a2 buzz 0.2, p4, p5, 1
	kenv xadsr .025, .25, .4, .2 ; ADSR envelope
	asig gain a2, kenv * .1
	outs asig, asig
endin

instr 3 ; Sub kick
	a3 buzz 1, 25, 3, 1
	kenv xadsr .00001, .01, .6, .5 ; Percussive ADSR envelope
	asig gain a3, kenv * .3
	adist distort asig, .9, gifn
	outs adist, adist
endin

;instr 4 ; piano sample
;;	istart invalue "sliderStart"
;;	iend invalue "sliderEnd"
;	kstart randh 1, 16000, 2
;	kend randh 1, 16000, 2
;	al, ar loscil 1, p4, gipiano, 1, 2, p5, p6
;	arevl, arevr freeverb al, ar, 1, 0.1
;	outs arevl, arevr
;endin

</CsInstruments>
<CsScore>
; Function table
; p1: identifier, p2: time in beats, p3:size, p4: gen routine (sinusoid) p4: fundamental amplitude
f 1 0 16384 10 1

t 0 135

;i 4 0 16 0.25 1200 1800

; Just Intonation scale based on 50Hz
;50.000
;52.778
;56.250
;59.375
;62.500
;66.667
;72.222
;75.000
;78.125
;83.333
;87.500
;94.444
;
;t 0 135
;; Scale
;i 2 0 1 50.000 3     
;i 2 + 1 52.778 3 
;i 2 + 1 56.250 3 
;i 2 + 1 59.375 3 
;i 2 + 1 62.500 3 
;i 2 + 1 66.667 3 
;i 2 + 1 72.222 3 
;i 2 + 1 75.000 3 
;i 2 + 1 78.125 3 
;i 2 + 1 83.333 3 
;i 2 + 1 87.500 3 
;i 2 + 1 94.444 3 
;i 2 + 8 100.000 3 


;
r 4
t 0 135

; Arpeggio on i 2
i 2 0 1 50 8
i 2 0.5 1 75 16
i 2 1 1 200 1
i 2 1.5 1 200 3
i 2 2 1 100 2
i 2 2.5 1 50 1
i 2 3 1 75 4
i 2 3.5 0.5 400 6

; Rhythm on i 1
i 1 0 1 120 200
i 1 1 1 120 180
i 1 1 1 4000 4000
i 1 2 1 120 190
i 1 3 1 120 180
i 1 3 1 5000 5000

;i 1 0 1 100 50
;i 1 0.67 2 4000 50
;i 1 1 1 1000 200
;i 1 1.33 1 8000 2000
;i 1 2 1 100 50
;i 1 2.33 1 8000 4000
;i 1 2.67 1 8000 50
;i 1 3 1 1200 100
;i 1 3.67 0.3 120 10
s

r 4 
t 0 135

; Arpeggio on i 2
i 2 0 1 50 8
i 2 0.5 1 59.375 20
i 2 1 1 200 6
i 2 1.5 1 87.5 5
i 2 2 1 100 4
i 2 2.5 1 50 3
i 2 3 1 72.222 12
i 2 3.5 0.5 188.889 16

; Rhythm on i 1
i 1 0 1 120 200
i 1 1 1 110 180
i 1 1 1 4000 4000
i 1 2 1 120 190
i 1 2.75 1 4600 10000
i 1 3 1 110 180
i 1 3 1 5000 5000
i 1 3.75 .25 4800 100

; Subs
i 3 0 0.5 
i 3 1 0.5 
i 3 2 0.5 
i 3 3 0.5 


s
e

</CsScore>
</CsoundSynthesizer>




<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
 <bsbObject type="BSBButton" version="2">
  <objectName>button0</objectName>
  <x>148</x>
  <y>110</y>
  <width>100</width>
  <height>30</height>
  <uuid>{c09012da-40ac-40d5-9c93-106597f188bd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>button0</text>
  <image>/</image>
  <eventLine>i1 0 10 2 100</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>sliderStart</objectName>
  <x>335</x>
  <y>63</y>
  <width>20</width>
  <height>100</height>
  <uuid>{6f999d8f-8888-47cc-885c-7733d2af6246}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>48000.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>sliderEnd</objectName>
  <x>407</x>
  <y>133</y>
  <width>20</width>
  <height>100</height>
  <uuid>{874cbeac-bfc5-42ba-8f17-9ceb50a8adec}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.70000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
<EventPanel name="" tempo="60.00000000" loop="8.00000000" x="632" y="382" width="655" height="346" visible="true" loopStart="0" loopEnd="0">    </EventPanel>
