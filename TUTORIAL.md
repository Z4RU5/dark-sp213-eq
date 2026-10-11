**Türkçe: [REHBER.md](REHBER.md)**

# Tutorial: setting up the Dark SP-213 EQ

About 10 minutes, one restart. You don't need to know anything about audio.

## 1. Connect the speakers properly

- **Audio cable (3.5 mm jack):** on a desktop, use the **green jack on the back** of the PC. Front-panel jacks often pick up more noise. On a laptop, use the headphone jack.
- **USB cable:** this only powers the speakers. If you hear a faint hiss when nothing is playing, plug it into a phone charger or your modem's USB port instead of the PC.

## 2. Find the name of your speaker output

Open **Settings > System > Sound**. Under **Output**, note the name of the selected device, for example **Speakers (Realtek(R) Audio)**. You'll pick this device in the next step.

## 3. Install Equalizer APO

1. Download it from its official page: https://sourceforge.net/projects/equalizerapo/ (green **Download** button).
2. Run the installer and accept the defaults.
3. At the end, the **Device Selector** window opens. On the **Playback devices** tab, tick the device you noted in step 2. Leave everything else alone and click **OK**.
4. **Restart the PC.** Equalizer APO only starts working after a restart.

Equalizer APO's windows are in English only.

## 4. Download this EQ

1. Open the [latest release](https://github.com/Z4RU5/dark-sp213-eq/releases/latest) and download `dark-sp213-eq-v….zip` (under **Assets**).
2. Right-click the downloaded ZIP > **Extract All**. Don't run anything from inside the ZIP.

## 5. Run the installer

1. In the extracted folder, right-click `install.ps1` > **Run with PowerShell**. On Windows 11 you may need to click **Show more options** first.
2. If you see a security warning, choose **Run once** (`R`). If Windows asks for admin permission, click **Yes**.
3. Pick a preset: **1** (Balanced) is the best starting point.
4. When it says "Done", the EQ is on. No restart needed.

Everything will be a little quieter than before; that's on purpose, so nothing distorts. Turn the speaker knob up a bit.

## 6. Hear the difference

Open **Configuration Editor** from the Start menu (in the Equalizer APO folder). You'll see a row `Include: dark-sp213.txt`. The round power button at its left turns the EQ off and on, so you can compare before and after while music plays. Leave it **on** when you're done.

## Fine-tuning

- **Different taste:** run `install.ps1` again and pick another preset.
- **Your own numbers:** open Notepad **as administrator**, then open `C:\Program Files\EqualizerAPO\config\dark-sp213.txt`. Every `Gain` value is in dB. More negative means less of that frequency. For example, changing the 150 Hz line from `-5 dB` to `-3 dB` brings some bass back. Changes apply as soon as you save.

## If the script won't run: manual install

1. Copy the preset you want from the `presets` folder into `C:\Program Files\EqualizerAPO\config\` and rename it to `dark-sp213.txt`.
2. Open `config.txt` in the same folder with Notepad (as administrator), delete everything in it, and write this one line:
   ```
   Include: dark-sp213.txt
   ```
3. Save. It's on immediately.

## Troubleshooting

**The sound didn't change at all**
- You probably ticked the wrong device. Open **Device Selector** from the Start menu (Equalizer APO folder), tick the output your speakers are on, click OK, restart.
- Still nothing? In Device Selector, open **Troubleshooting options**, tick **Install as SFX/EFX (experimental)**, then OK and restart. Some Realtek drivers need this.
- In **Settings > System > Sound**, click your speakers and check that **Audio enhancements** is set to **Device default effects**, not **Off**. Equalizer APO doesn't run when enhancements are off.

**It worked, then stopped after a Windows or driver update**
Updates sometimes unhook Equalizer APO. Open Device Selector, tick the device again, restart.

**Everything got quieter**
That's normal (see step 5). Turn the speaker knob up.

**It distorts at high volume**
Turn the speaker knob down a little, or switch to the Balanced preset. These are 11 W speakers; they have a limit.

**Faint hiss or buzz when nothing is playing**
Not related to the EQ. Power the speakers' USB plug from a phone charger or your modem instead of the PC.

**"Running scripts is disabled on this system"**
Right-click `install.ps1` > **Properties**, tick **Unblock** at the bottom, OK, then try again. If it still won't run, use the manual install above.

**Only one side plays, or it crackles when you move the cable**
That's the cable or jack, not the EQ. Reseat the plug, or try another jack.

## Removing it

Run `install.ps1` and choose **4**. Or uninstall Equalizer APO from **Settings > Apps** to remove everything.
