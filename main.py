# coding:UTF-8

from kivy.app import App
from kivy.uix.widget import Widget
from kivy.uix.button import Button
import csnd6


class CSoundTestApp(App):

    __version__ = "0.1"
    csound = csnd6.Csound()
    perf = csnd6.CsoundPerformanceThread(csound)

    def build(self):
        screen = Widget()
        play_button = Button()
        play_button.text = 'Play ►'
        play_button.on_press = self.play
        screen.add_widget(play_button)
        return screen

    def destroy_settings(self):
        csnd6.csoundDestroy(self.csound)

    def play(self):
        if self.perf.isRunning():
            self.perf.Stop()
        else:
            # The '-odac' parameter specifies output to DAC. Otherwise it saves a WAV file.
            self.csound.Compile('-odac', 'Noise.csd')
            self.csound.Perform()
            self.perf.Play()

if __name__ == '__main__':
    CSoundTestApp().run()
