# BhugtanEase Medical — Windows Installer (Auto-Build via GitHub Actions)

Ye repo aapke `BhugtanEase_Medical.pyw` se automatically Windows installer
(`.exe`) bana deta hai — **GitHub Actions** ke through, bina kisi Windows
PC ke. Build 32-bit Python use karta hai, isliye final EXE Windows 7, 8,
8.1, 10, aur 11 par chalegi — **32-bit aur 64-bit dono editions** par.

## Folder me kya hai

```
BhugtanEase_Medical.pyw       <- aapka app (DB_FILE bug fix ke saath)
app_icon.ico                  <- aapka logo icon (YAHAN DAALNA HAI)
requirements.txt              <- Python dependencies
installer/
  BhugtanEaseMedical.iss      <- Inno Setup installer script
.github/workflows/build.yml   <- GitHub Actions build pipeline
```

## Setup karne ke steps (ek baar)

1. **GitHub.com** par jaake naya repository banao (Private rakh sakte ho,
   private repos pe bhi Actions free chalti hai).

2. Is poore folder ka content us repo me daal do. Sabse aasan tareeka:
   - GitHub repo page kholo -> "Add file" -> "Upload files"
   - Yahan ke saare files/folders drag-drop karo (structure same rakhna —
     `.github` folder bhi upload karna, GitHub usko sahi se le lega)
   - **`app_icon.ico` file zaroor daalo** (repo ke root me, jahan `.pyw`
     file hai — `installer` folder ke andar NAHI)
   - "Commit changes" dabao

3. Commit hote hi **Actions tab automatically build start kar dega.**
   - Repo me "Actions" tab kholo
   - "Build BhugtanEase Medical Windows Installer" workflow dikhega
   - 3-5 minute lagte hain (Inno Setup install + PyInstaller build)

4. Build complete hone par, us workflow run ke neeche "Artifacts" section
   me 2 files milengi:
   - **`BhugtanEase_Medical_Setup`** — ye asli installer hai jo customer
     ko dena hai. Download karke zip extract karo, andar
     `BhugtanEase_Medical_Setup.exe` milegi.
   - **`BhugtanEase_Medical_RawEXE`** — sirf app ki exe (installer ke
     bina), agar kabhi chahiye ho.

## Customer ko kya dena hai

Sirf **`BhugtanEase_Medical_Setup.exe`** file. Customer double-click
karega, installer chalega, Desktop shortcut bhi option se ban jayega,
Start Menu me bhi entry aa jayegi. Uninstall bhi normal Windows
"Add/Remove Programs" se ho sakta hai.

## Agar future me code update karna ho

1. `.pyw` file me changes karo
2. Wapas GitHub repo me upload/commit karo (same file ko overwrite karna)
3. Action phir se automatically chalegi aur nayi Setup.exe ban jayegi
4. Agar version number badalna ho to `installer/BhugtanEaseMedical.iss`
   me `#define MyAppVersion "1.0.0"` line edit kar dena

## Important notes

- **DB_FILE bug already fix kiya gaya hai** is `.pyw` file me — ab
  `sys.executable` ka path use hoga jab EXE ke roop me chalega, isliye
  customer ka data restart ke baad bhi safe rahega.
- Installer **32-bit** banaya gaya hai (`x86` Python) — ye intentional
  hai, isse hi Windows 7/8/10/11 ke 32-bit aur 64-bit dono versions par
  chalti hai. 64-bit-only build Windows 7/8/10 ke 32-bit edition par
  nahi chalti.
- `--windowed` flag use hua hai, isliye exe chalne par koi black console
  window nahi dikhega — sirf app ki window khulegi.
- Agar `app_icon.ico` file missing ho aur push ho jaye, build **fail**
  ho jayega (icon file zaroor honi chahiye, taaki aapko pata chal jaye
  ki kuch missing hai).
