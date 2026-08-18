@echo off
setlocal EnableDelayedExpansion
chcp 65001 >nul 2>&1
powershell -Command "[Console]::OutputEncoding = [System.Text.Encoding]::UTF8" >nul 2>&1
title AI Coding System - ULTIMATE HACKER [GOD MODE FINAL]
color 0A

:STEP0
cls
echo(
echo  ======================================================================
echo        STEP 0: SELECT WORKSPACE LOCATION (PORTABLE MODE)
echo  ======================================================================
echo(
echo   Enter a Drive Letter (e.g., X:) or a Custom Folder Path.
echo   (Leave blank and press Enter to use Desktop\GhostBox)
echo(
set /p "BASE_PATH=  Path: "

if "!BASE_PATH!"=="" (
    set "BASE_DIR=%USERPROFILE%\Desktop\GhostBox"
    echo   [INFO] Using Desktop GhostBox: !BASE_DIR!
) else (
    set "BASE_DIR=!BASE_PATH!"
    echo   [INFO] Using Custom Path: !BASE_DIR!
)

:: Ensure base directory exists
if not exist "!BASE_DIR!" mkdir "!BASE_DIR!" >nul 2>&1

set "PYTHON_DIR=!BASE_DIR!\Python311"
set "SCRIPTS_DIR=!BASE_DIR!\Scripts"
set "PYTHON_EXE=!PYTHON_DIR!\python.exe"
set "TGPT_EXE=!SCRIPTS_DIR!\tgpt.exe"
set "CONFIG_FILE=!BASE_DIR!\config.ini"
set "PROXIES_FILE=!BASE_DIR!\proxies.txt"
set "CUSTOM_APIS_FILE=!BASE_DIR!\custom_apis.txt"

:: Cleanup garbage files from previous buggy runs
if exist "%USERPROFILE%\Desktop\60000" del "%USERPROFILE%\Desktop\60000" >nul 2>&1
if exist "60000" del "60000" >nul 2>&1
if exist "!SCRIPTS_DIR!\60000" del "!SCRIPTS_DIR!\60000" >nul 2>&1

:MENU
cls
echo(
echo  ======================================================================
echo        AI CODING SYSTEM - ULTIMATE HACKER [GOD MODE FINAL]
echo        [WARP CF Bypass - No Popup - GPT-5.6 Luna/Sol]
echo        BASE DIR: !BASE_DIR!
echo  ======================================================================
echo(
echo   [1]  Setup All Components (Install WARP/curl_cffi)
echo(
echo   --- TOOLS (Auto-scan ALL working) ---
echo   [2]  Quantum Deep Scan (Text Only)
echo   [3]  Claude Hunt (Deep scan for Claude)
echo   [4]  TGPT Mode (24+ terminal providers)
echo   [5]  Nvidia Scanner (ALL models from API)
echo   [6]  Secret Tools (Deep coding)
echo   [A]  AI File Agent (Read/Fix/Search)
echo   [R]  Repo Analyzer (Repomix-Style Deep Pack)
echo   [G]  GPT-5 / Next-Gen Hunt (Luna/Sol/o1/o3)
echo(
echo   --- QUICK ACCESS ---
echo   [C]  Use Cache ^& Chat (Load ^& Connect)
echo   [T]  Custom API Tokens (Deep Scan Models)
echo   [F]  File Analyzer (Deep Code Review)
echo(
echo   --- SYSTEM ---
echo   [7]  Edit Nvidia Api Key
echo   [8]  Cleanup All (Delete GhostBox)
echo   [9]  View Error Log
echo   [0]  Exit
echo(
echo  ======================================================================
echo(
set /p choice="  Select [0-9/C/T/G/F/A/R]: "

if "%choice%"=="1" goto SETUP
if "%choice%"=="2" goto QUANTUM_SCAN
if "%choice%"=="3" goto CLAUDE_HUNT
if "%choice%"=="4" goto TGPT_MODE
if "%choice%"=="5" goto NVIDIA_SCAN
if "%choice%"=="6" goto SECRET_TOOLS
if /i "%choice%"=="A" goto AI_AGENT
if /i "%choice%"=="R" goto REPO_ANALYZER
if "%choice%"=="G" goto GPT5_HUNT
if "%choice%"=="C" goto USE_CACHE
if "%choice%"=="T" goto CUSTOM_API
if "%choice%"=="F" goto FILE_ANALYZER
if "%choice%"=="7" goto EDIT_KEYS
if "%choice%"=="8" goto CLEANUP
if "%choice%"=="9" goto VIEW_LOG
if "%choice%"=="0" goto EXIT
goto MENU

:: ======================================================================
:: SETUP
:: ======================================================================
:SETUP
cls
echo(
echo  ======================================================================
echo              SETTING UP ALL COMPONENTS
echo              BASE: !BASE_DIR!
echo  ======================================================================
echo(

if exist "!PYTHON_EXE!" (
    echo   [INFO] Python exists.
    set /p "reinstall=  Reinstall all? (yes/no): "
    if /i "!reinstall!"=="yes" (
        rmdir /s /q "!PYTHON_DIR!" >nul 2>&1
        rmdir /s /q "!SCRIPTS_DIR!" >nul 2>&1
    ) else (
        goto GEN_ONLY
    )
)

echo   [1/8] Creating directories...
if not exist "!PYTHON_DIR!" mkdir "!PYTHON_DIR!"
if not exist "!SCRIPTS_DIR!" mkdir "!SCRIPTS_DIR!"
echo   [OK]

echo(
echo   [2/8] Downloading Python 3.11.9 Portable...
set "PYTHON_ZIP=%TEMP%\python_embed.zip"
if not exist "!PYTHON_ZIP!" (
    powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://www.python.org/ftp/python/3.11.9/python-3.11.9-embed-amd64.zip' -OutFile '!PYTHON_ZIP!' -UseBasicParsing"
)
echo   [OK]

echo(
echo   [3/8] Extracting Python...
powershell -Command "Expand-Archive -Path '!PYTHON_ZIP!' -DestinationPath '!PYTHON_DIR!' -Force"
if not exist "!PYTHON_EXE!" (
    echo   [ERROR] Extraction failed.
    pause
    goto MENU
)
echo   [OK]

echo(
echo   [4/8] Configuring Python...
(
echo python311.zip
echo .
echo Lib\site-packages
echo import site
) > "!PYTHON_DIR!\python311._pth"
echo   [OK]

echo(
echo   [5/8] Installing pip...
set "GETPIP=%TEMP%\get-pip.py"
if not exist "!GETPIP!" (
    powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://bootstrap.pypa.io/get-pip.py' -OutFile '!GETPIP!' -UseBasicParsing"
)
"!PYTHON_EXE!" "!GETPIP!" --no-warn-script-location --quiet
echo   [OK]

:GEN_ONLY
:: CRITICAL FIX: Ensure Scripts directory exists before generating files
if not exist "!SCRIPTS_DIR!" mkdir "!SCRIPTS_DIR!" >nul 2>&1

echo(
echo   [6/8] Installing Ultimate Python packages (WARP + curl_cffi)...
"!PYTHON_EXE!" -m pip install -U openai colorama requests g4f httpx aiohttp PySocks curl_cffi --no-warn-script-location --quiet
echo   [OK]

echo(
echo   [7/8] Downloading TGPT...
if not exist "!TGPT_EXE!" (
    powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://github.com/aandrew-me/tgpt/releases/latest/download/tgpt-amd64.exe' -OutFile '!TGPT_EXE!' -UseBasicParsing"
)
echo   [OK]

echo(
echo   [8/8] Creating config...
if not exist "!CONFIG_FILE!" (
    echo [NVIDIA]> "!CONFIG_FILE!"
    echo API_KEY=your_nvidia_api_key_here>> "!CONFIG_FILE!"
)
echo   [OK]

if exist "!PYTHON_ZIP!" del "!PYTHON_ZIP!" >nul 2>&1
if exist "!GETPIP!" del "!GETPIP!" >nul 2>&1

echo(
echo   Generating God-Mode Python files...

:: Generate paths.py for dynamic path resolution
> "!SCRIPTS_DIR!\paths.py" echo import os
>> "!SCRIPTS_DIR!\paths.py" echo BASE_DIR = r"!BASE_DIR!"
>> "!SCRIPTS_DIR!\paths.py" echo PYTHON_DIR = os.path.join(BASE_DIR, "Python311")
>> "!SCRIPTS_DIR!\paths.py" echo SCRIPTS_DIR = os.path.join(BASE_DIR, "Scripts")
>> "!SCRIPTS_DIR!\paths.py" echo PYTHON_EXE = os.path.join(PYTHON_DIR, "python.exe")
>> "!SCRIPTS_DIR!\paths.py" echo CONFIG_FILE = os.path.join(BASE_DIR, "config.ini")
>> "!SCRIPTS_DIR!\paths.py" echo PROXIES_FILE = os.path.join(BASE_DIR, "proxies.txt")
>> "!SCRIPTS_DIR!\paths.py" echo CUSTOM_APIS_FILE = os.path.join(BASE_DIR, "custom_apis.txt")

set "GEN=!SCRIPTS_DIR!\generator.py"

> "!GEN!" echo import os
>> "!GEN!" echo D = os.path.join(r"!BASE_DIR!", 'Scripts')
>> "!GEN!" echo def w(name, code):
>> "!GEN!" echo     path = os.path.join(D, name)
>> "!GEN!" echo     with open(path, 'w', encoding='utf-8') as f:
>> "!GEN!" echo         f.write(code)
>> "!GEN!" echo     print('  Created: ' + name)
>> "!GEN!" echo H = '''import sys, os, subprocess, asyncio, webbrowser, warnings, logging, types, threading, urllib.request, re
>> "!GEN!" echo from concurrent.futures import ThreadPoolExecutor, as_completed
>> "!GEN!" echo warnings.filterwarnings('ignore')
>> "!GEN!" echo logging.disable(logging.CRITICAL)
>> "!GEN!" echo _CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))
>> "!GEN!" echo sys.path.insert(0, _CURRENT_DIR)
>> "!GEN!" echo try:
>> "!GEN!" echo     from paths import BASE_DIR, SCRIPTS_DIR, PYTHON_DIR, CONFIG_FILE, PROXIES_FILE, CUSTOM_APIS_FILE
>> "!GEN!" echo except ImportError:
>> "!GEN!" echo     print('[ERROR] paths.py not found. Run Setup.')
>> "!GEN!" echo     sys.exit(1)
>> "!GEN!" echo if not os.path.exists(SCRIPTS_DIR): os.makedirs(SCRIPTS_DIR)
>> "!GEN!" echo os.chdir(SCRIPTS_DIR)
>> "!GEN!" echo webbrowser.open = lambda *a, **k: None
>> "!GEN!" echo webbrowser.open_new = lambda *a, **k: None
>> "!GEN!" echo webbrowser.open_new_tab = lambda *a, **k: None
>> "!GEN!" echo webbrowser.get = lambda *a, **k: None
>> "!GEN!" echo if hasattr(os, 'startfile'): os.startfile = lambda *a, **k: None
>> "!GEN!" echo _browsers = ['msedge','chrome','firefox','iexplore','edge','brave','opera','vivaldi','chromium','chromedriver','msedgedriver','geckodriver','safaridriver','uc.exe','undetected','nodriver','drission','webbrowser','start http']
>> "!GEN!" echo def _is_browser(cmd):
>> "!GEN!" echo     if not cmd: return False
>> "!GEN!" echo     s = str(cmd).lower()
>> "!GEN!" echo     return any(x in s for x in _browsers)
>> "!GEN!" echo _orig_popen = subprocess.Popen
>> "!GEN!" echo class SafePopen:
>> "!GEN!" echo     def __init__(self, *args, **kwargs):
>> "!GEN!" echo         cmd = args[0] if args else kwargs.get('args')
>> "!GEN!" echo         if _is_browser(cmd): raise RuntimeError('Browser Blocked')
>> "!GEN!" echo         self._proc = _orig_popen(*args, **kwargs)
>> "!GEN!" echo     def __enter__(self):
>> "!GEN!" echo         if hasattr(self._proc, '__enter__'): return self._proc.__enter__()
>> "!GEN!" echo         return self
>> "!GEN!" echo     def __exit__(self, exc_type, exc_val, exc_tb):
>> "!GEN!" echo         if hasattr(self._proc, '__exit__'): return self._proc.__exit__(exc_type, exc_val, exc_tb)
>> "!GEN!" echo         return False
>> "!GEN!" echo     def __getattr__(self, name): return getattr(self._proc, name)
>> "!GEN!" echo subprocess.Popen = SafePopen
>> "!GEN!" echo _orig_run = subprocess.run
>> "!GEN!" echo def _safe_run(*args, **kwargs):
>> "!GEN!" echo     cmd = args[0] if args else kwargs.get('args')
>> "!GEN!" echo     if _is_browser(cmd): raise RuntimeError('Browser Blocked')
>> "!GEN!" echo     return _orig_run(*args, **kwargs)
>> "!GEN!" echo subprocess.run = _safe_run
>> "!GEN!" echo _orig_call = subprocess.call
>> "!GEN!" echo def _safe_call(*args, **kwargs):
>> "!GEN!" echo     cmd = args[0] if args else kwargs.get('args')
>> "!GEN!" echo     if _is_browser(cmd): return 0
>> "!GEN!" echo     return _orig_call(*args, **kwargs)
>> "!GEN!" echo subprocess.call = _safe_call
>> "!GEN!" echo _orig_system = os.system
>> "!GEN!" echo def _safe_system(cmd):
>> "!GEN!" echo     if _is_browser(cmd): return 0
>> "!GEN!" echo     return _orig_system(cmd)
>> "!GEN!" echo os.system = _safe_system
>> "!GEN!" echo _orig_asyncio_exec = asyncio.create_subprocess_exec
>> "!GEN!" echo async def _safe_asyncio_exec(*args, **kwargs):
>> "!GEN!" echo     if _is_browser(args): raise RuntimeError('Browser Blocked')
>> "!GEN!" echo     return await _orig_asyncio_exec(*args, **kwargs)
>> "!GEN!" echo asyncio.create_subprocess_exec = _safe_asyncio_exec
>> "!GEN!" echo class DummyModule(types.ModuleType):
>> "!GEN!" echo     def __getattr__(self, name): return self
>> "!GEN!" echo     def __call__(self, *args, **kwargs): return self
>> "!GEN!" echo     def __enter__(self): return self
>> "!GEN!" echo     def __exit__(self, *args): pass
>> "!GEN!" echo for mod in ['selenium', 'selenium.webdriver', 'selenium.webdriver.chrome.service', 'selenium.webdriver.chrome.options', 'undetected_chromedriver', 'nodriver', 'DrissionPage', 'pywebview', 'playwright']:
>> "!GEN!" echo     sys.modules[mod] = DummyModule(mod)
>> "!GEN!" echo os.environ['BROWSER'] = 'cmd /c exit 0'
>> "!GEN!" echo os.environ['G4F_BROWSER'] = 'none'
>> "!GEN!" echo os.environ['G4F_BROWSER_HEADLESS'] = '1'
>> "!GEN!" echo os.environ['G4F_WEBDRIVER'] = 'none'
>> "!GEN!" echo os.environ['G4F_NO_BROWSER'] = '1'
>> "!GEN!" echo os.environ['G4F_TIMEOUT'] = '10'
>> "!GEN!" echo os.environ['PYTHONUNBUFFERED'] = '1'
>> "!GEN!" echo sys.path.insert(0, os.path.join(PYTHON_DIR, 'Lib', 'site-packages'))
>> "!GEN!" echo import requests
>> "!GEN!" echo def check_q():
>> "!GEN!" echo     if os.name == 'nt':
>> "!GEN!" echo         import msvcrt
>> "!GEN!" echo         if msvcrt.kbhit():
>> "!GEN!" echo             if msvcrt.getch().decode('utf-8', errors='ignore').lower() == 'q': return True
>> "!GEN!" echo     return False
>> "!GEN!" echo def _test_proxy(proxy):
>> "!GEN!" echo     try:
>> "!GEN!" echo         r = requests.get('http://httpbin.org/ip', proxies={'http': proxy, 'https': proxy}, timeout=4)
>> "!GEN!" echo         return r.status_code == 200
>> "!GEN!" echo     except Exception:
>> "!GEN!" echo         return False
>> "!GEN!" echo def load_proxies():
>> "!GEN!" echo     p = []
>> "!GEN!" echo     try:
>> "!GEN!" echo         sp = urllib.request.getproxies()
>> "!GEN!" echo         for v in sp.values():
>> "!GEN!" echo             if v: p.append(v)
>> "!GEN!" echo     except Exception:
>> "!GEN!" echo         pass
>> "!GEN!" echo     if 'http://127.0.0.1:40000' not in p: p.append('http://127.0.0.1:40000')
>> "!GEN!" echo     try:
>> "!GEN!" echo         with open(PROXIES_FILE, 'r') as f:
>> "!GEN!" echo             for l in f:
>> "!GEN!" echo                 l = l.strip()
>> "!GEN!" echo                 if l: p.append(l)
>> "!GEN!" echo     except Exception:
>> "!GEN!" echo         pass
>> "!GEN!" echo     working = []
>> "!GEN!" echo     for proxy in p:
>> "!GEN!" echo         if _test_proxy(proxy):
>> "!GEN!" echo             working.append(proxy)
>> "!GEN!" echo             print('  [PROXY] Online: ' + proxy)
>> "!GEN!" echo         else:
>> "!GEN!" echo             print('  [PROXY] Skipping offline: ' + proxy)
>> "!GEN!" echo     return working
>> "!GEN!" echo def set_proxy(proxy):
>> "!GEN!" echo     if proxy:
>> "!GEN!" echo         os.environ['HTTP_PROXY'] = proxy
>> "!GEN!" echo         os.environ['HTTPS_PROXY'] = proxy
>> "!GEN!" echo         os.environ.pop('NO_PROXY', None)
>> "!GEN!" echo     else:
>> "!GEN!" echo         os.environ.pop('HTTP_PROXY', None)
>> "!GEN!" echo         os.environ.pop('HTTPS_PROXY', None)
>> "!GEN!" echo         os.environ.pop('NO_PROXY', None)
>> "!GEN!" echo try:
>> "!GEN!" echo     from colorama import init, Fore, Style
>> "!GEN!" echo     init(autoreset=True)
>> "!GEN!" echo     import g4f
>> "!GEN!" echo     from g4f.client import Client
>> "!GEN!" echo except Exception as e:
>> "!GEN!" echo     print('[ERROR] ' + str(e))
>> "!GEN!" echo     input('Press Enter...')
>> "!GEN!" echo     sys.exit(1)
>> "!GEN!" echo PROXIES = load_proxies()
>> "!GEN!" echo PROXY = PROXIES[0] if PROXIES else None
>> "!GEN!" echo PROXY_STATUS = 'Active (' + PROXY + ')' if PROXY else 'Direct'
>> "!GEN!" echo if PROXY: set_proxy(PROXY)
>> "!GEN!" echo else: set_proxy(None)
>> "!GEN!" echo CACHE_LIST = [os.path.join(SCRIPTS_DIR, 'cache_quantum.txt'), os.path.join(SCRIPTS_DIR, 'cache_claude.txt'), os.path.join(SCRIPTS_DIR, 'cache_secret.txt'), os.path.join(SCRIPTS_DIR, 'cache_gpt5.txt')]
>> "!GEN!" echo def load_workers():
>> "!GEN!" echo     res = []
>> "!GEN!" echo     for cf in CACHE_LIST:
>> "!GEN!" echo         if os.path.exists(cf):
>> "!GEN!" echo             with open(cf,'r',encoding='utf-8') as f:
>> "!GEN!" echo                 for line in f:
>> "!GEN!" echo                     line=line.strip()
>> "!GEN!" echo                     if line and '~' in line:
>> "!GEN!" echo                         p,m=line.split('~',1)
>> "!GEN!" echo                         res.append((p,m))
>> "!GEN!" echo     return res
>> "!GEN!" echo '''
>> "!GEN!" echo quantum = H + '''
>> "!GEN!" echo CACHE_FILE = os.path.join(SCRIPTS_DIR, 'cache_quantum.txt')
>> "!GEN!" echo def get_providers():
>> "!GEN!" echo     names = []
>> "!GEN!" echo     browser_providers = {'Bing', 'DuckDuckGo', 'HuggingChat', 'PerplexityLabs', 'You', 'PerplexityAI', 'Pi', 'Bard', 'OpenaiChat', 'Gemini', 'HuggingFace', 'Vercel', 'Raycast', 'DeepInfraChat', 'Cloudflare', 'AiChatOnline', 'ChatGLM', 'Cerebras'}
>> "!GEN!" echo     image_kw = ['image','flux','stable','pollin','sdxl','sd3','dalle','midjourney','media','video','audio','music','picture','draw']
>> "!GEN!" echo     for n in dir(g4f.Provider):
>> "!GEN!" echo         if n.startswith('_') or not n[0].isupper(): continue
>> "!GEN!" echo         if n in browser_providers: continue
>> "!GEN!" echo         if any(k in n.lower() for k in image_kw): continue
>> "!GEN!" echo         obj = getattr(g4f.Provider, n, None)
>> "!GEN!" echo         if obj is None: continue
>> "!GEN!" echo         if hasattr(obj, 'needs_auth') and obj.needs_auth: continue
>> "!GEN!" echo         names.append(n)
>> "!GEN!" echo     return names
>> "!GEN!" echo def get_models():
>> "!GEN!" echo     models = ['gpt-4', 'gpt-4o', 'gpt-4o-mini', 'gpt-3.5-turbo', 'gpt-5', 'gpt-5.6-luna', 'gpt-5.6-sol', 'gpt-5-turbo', 'o1', 'o1-mini', 'o1-preview', 'o3', 'o3-mini', 'claude-3-5-sonnet', 'claude-3-opus', 'claude-3-sonnet', 'claude-3-haiku', 'claude-sonnet-4-20250514', 'claude-3-7-sonnet', 'deepseek-ai/DeepSeek-V3', 'deepseek-ai/DeepSeek-R1', 'meta-llama/Llama-3.1-405B-Instruct', 'meta-llama/Llama-3.1-70B-Instruct', 'Qwen/Qwen2.5-72B-Instruct', 'Qwen/Qwen2.5-Coder-32B-Instruct', 'microsoft/WizardLM-2-8x22B', 'openchat_3.5', 'codellama-34b', 'wizardcoder-34b', 'mixtral-8x22b']
>> "!GEN!" echo     try:
>> "!GEN!" echo         from g4f.models import Model
>> "!GEN!" echo         for m in dir(Model):
>> "!GEN!" echo             if not m.startswith('_'):
>> "!GEN!" echo                 obj = getattr(Model, m)
>> "!GEN!" echo                 if hasattr(obj, 'name'): models.append(obj.name)
>> "!GEN!" echo     except Exception: pass
>> "!GEN!" echo     return list(dict.fromkeys(models))
>> "!GEN!" echo def chat(pname, model, pc):
>> "!GEN!" echo     client = Client(proxy=PROXY)
>> "!GEN!" echo     hist = [{'role':'system','content':'Ultimate AI assistant. Reply Thai. Complete code.'}]
>> "!GEN!" echo     os.system('cls')
>> "!GEN!" echo     print('  ' + pname + ' / ' + model)
>> "!GEN!" echo     print('  exit=quit  reset=clear')
>> "!GEN!" echo     while True:
>> "!GEN!" echo         try:
>> "!GEN!" echo             ui = input(Fore.GREEN + '^> You: ' + Style.RESET_ALL).strip()
>> "!GEN!" echo             if not ui: continue
>> "!GEN!" echo             if ui.lower() in ['exit', 'quit', 'q']: return
>> "!GEN!" echo             if ui.lower() == 'reset':
>> "!GEN!" echo                 hist = [{'role':'system','content':'Ultimate AI assistant.'}]
>> "!GEN!" echo                 print(Fore.YELLOW + 'Cleared' + Style.RESET_ALL)
>> "!GEN!" echo                 continue
>> "!GEN!" echo             hist.append({'role':'user','content':ui})
>> "!GEN!" echo             rt = ''
>> "!GEN!" echo             stream = client.chat.completions.create(model=model, provider=pc, messages=hist, temperature=0.3, max_tokens=4096, stream=True)
>> "!GEN!" echo             for ch in stream:
>> "!GEN!" echo                 if check_q(): return
>> "!GEN!" echo                 if hasattr(ch, 'choices') and ch.choices:
>> "!GEN!" echo                     d = ch.choices[0].delta
>> "!GEN!" echo                     if hasattr(d, 'content') and d.content:
>> "!GEN!" echo                         if isinstance(d.content, str):
>> "!GEN!" echo                             print(d.content, end='', flush=True)
>> "!GEN!" echo                             rt += d.content
>> "!GEN!" echo                         else:
>> "!GEN!" echo                             print(Fore.YELLOW + chr(10) + '[INFO] Non-text response. Try another provider.' + Style.RESET_ALL)
>> "!GEN!" echo                             return
>> "!GEN!" echo             print()
>> "!GEN!" echo             hist.append({'role':'assistant','content':rt})
>> "!GEN!" echo         except Exception as e:
>> "!GEN!" echo             print(Fore.RED + '[ERROR] ' + str(e) + Style.RESET_ALL)
>> "!GEN!" echo def test_one(item):
>> "!GEN!" echo     pname, model = item
>> "!GEN!" echo     pc = getattr(g4f.Provider, pname, None)
>> "!GEN!" echo     if pc is None: return None
>> "!GEN!" echo     try:
>> "!GEN!" echo         client = Client(proxy=PROXY)
>> "!GEN!" echo         client.chat.completions.create(model=model, provider=pc, messages=[{'role':'user','content':'Hi'}], max_tokens=1, temperature=0)
>> "!GEN!" echo         return (pname, model, pc)
>> "!GEN!" echo     except Exception:
>> "!GEN!" echo         return None
>> "!GEN!" echo def main():
>> "!GEN!" echo     os.system('cls')
>> "!GEN!" echo     print(Fore.CYAN + '  QUANTUM ULTIMATE SCAN [MAX DEPTH / THREAD CORE]' + Style.RESET_ALL)
>> "!GEN!" echo     print('  Proxy: ' + PROXY_STATUS)
>> "!GEN!" echo     providers = get_providers()
>> "!GEN!" echo     models = get_models()
>> "!GEN!" echo     combos = []
>> "!GEN!" echo     for p in providers:
>> "!GEN!" echo         for m in models:
>> "!GEN!" echo             combos.append((p, m))
>> "!GEN!" echo     print('  Providers: ' + str(len(providers)))
>> "!GEN!" echo     print('  Models: ' + str(len(models)))
>> "!GEN!" echo     print('  Combos: ' + str(len(combos)))
>> "!GEN!" echo     print('  Press Q to stop')
>> "!GEN!" echo     working = []
>> "!GEN!" echo     done = 0
>> "!GEN!" echo     total = len(combos)
>> "!GEN!" echo     with ThreadPoolExecutor(max_workers=32) as ex:
>> "!GEN!" echo         futures = [ex.submit(test_one, c) for c in combos]
>> "!GEN!" echo         for fu in as_completed(futures):
>> "!GEN!" echo             if check_q(): break
>> "!GEN!" echo             done += 1
>> "!GEN!" echo             r = fu.result()
>> "!GEN!" echo             if r:
>> "!GEN!" echo                 working.append(r)
>> "!GEN!" echo                 print(Fore.GREEN + '  [OK] ' + r[0] + ' / ' + r[1] + Style.RESET_ALL)
>> "!GEN!" echo             if done %% 100 == 0:
>> "!GEN!" echo                 print('  Progress: ' + str(done) + '/' + str(total))
>> "!GEN!" echo     if working:
>> "!GEN!" echo         with open(CACHE_FILE, 'w', encoding='utf-8') as f:
>> "!GEN!" echo             for p, m, _ in working:
>> "!GEN!" echo                 f.write(p + '~' + m + chr(10))
>> "!GEN!" echo     print('  Found: ' + Fore.GREEN + str(len(working)) + Style.RESET_ALL)
>> "!GEN!" echo     if not working:
>> "!GEN!" echo         input('Press Enter...')
>> "!GEN!" echo         return
>> "!GEN!" echo     while True:
>> "!GEN!" echo         print()
>> "!GEN!" echo         for i, (p, m, _) in enumerate(working, 1):
>> "!GEN!" echo             print('  [' + str(i) + '] ' + p + ' / ' + m)
>> "!GEN!" echo         print('  [0] Back  [R] Re-scan')
>> "!GEN!" echo         c = input('  Select: ').strip()
>> "!GEN!" echo         if c == '0': return
>> "!GEN!" echo         if c.lower() == 'r': return main()
>> "!GEN!" echo         try:
>> "!GEN!" echo             idx = int(c) - 1
>> "!GEN!" echo             if 0 ^<= idx ^< len(working):
>> "!GEN!" echo                 chat(working[idx][0], working[idx][1], working[idx][2])
>> "!GEN!" echo         except Exception:
>> "!GEN!" echo             pass
>> "!GEN!" echo if __name__ == '__main__': main()
>> "!GEN!" echo '''
>> "!GEN!" echo w('quantum_scan.py', quantum)
>> "!GEN!" echo claude = H + '''
>> "!GEN!" echo CACHE_FILE = os.path.join(SCRIPTS_DIR, 'cache_claude.txt')
>> "!GEN!" echo def get_providers():
>> "!GEN!" echo     names = []
>> "!GEN!" echo     blacklist = {'Bing', 'DuckDuckGo', 'HuggingChat', 'PerplexityLabs', 'You', 'PerplexityAI', 'Pi', 'Bard', 'OpenaiChat', 'Gemini', 'HuggingFace', 'Vercel', 'Raycast', 'DeepInfraChat', 'Cloudflare', 'AiChatOnline', 'ChatGLM', 'Cerebras'}
>> "!GEN!" echo     blacklist_kw = ['image', 'flux', 'stable', 'pollin', 'sdxl', 'sd3', 'dalle', 'midjourney', 'media']
>> "!GEN!" echo     for n in dir(g4f.Provider):
>> "!GEN!" echo         if n.startswith('_') or not n[0].isupper(): continue
>> "!GEN!" echo         if n in blacklist: continue
>> "!GEN!" echo         if any(kw in n.lower() for kw in blacklist_kw): continue
>> "!GEN!" echo         obj = getattr(g4f.Provider, n, None)
>> "!GEN!" echo         if obj is None: continue
>> "!GEN!" echo         if hasattr(obj, 'needs_auth') and obj.needs_auth: continue
>> "!GEN!" echo         names.append(n)
>> "!GEN!" echo     return names
>> "!GEN!" echo def chat(pname, model, pc):
>> "!GEN!" echo     client = Client(proxy=PROXY)
>> "!GEN!" echo     hist = [{'role':'system','content':'Claude expert. Reply Thai. Complete code.'}]
>> "!GEN!" echo     os.system('cls')
>> "!GEN!" echo     print('  CLAUDE - ' + pname + ' / ' + model)
>> "!GEN!" echo     while True:
>> "!GEN!" echo         try:
>> "!GEN!" echo             ui = input(Fore.GREEN + '^> You: ' + Style.RESET_ALL).strip()
>> "!GEN!" echo             if not ui: continue
>> "!GEN!" echo             if ui.lower() in ['exit', 'quit', 'q']: return
>> "!GEN!" echo             hist.append({'role':'user', 'content':ui})
>> "!GEN!" echo             try:
>> "!GEN!" echo                 rt = ''
>> "!GEN!" echo                 stream = client.chat.completions.create(model=model, provider=pc, messages=hist, temperature=0.3, max_tokens=4096, stream=True)
>> "!GEN!" echo                 for ch in stream:
>> "!GEN!" echo                     if check_q(): return
>> "!GEN!" echo                     if hasattr(ch, 'choices') and ch.choices:
>> "!GEN!" echo                         d = ch.choices[0].delta
>> "!GEN!" echo                         if hasattr(d, 'content') and d.content:
>> "!GEN!" echo                             if isinstance(d.content, str):
>> "!GEN!" echo                                 print(d.content, end='', flush=True)
>> "!GEN!" echo                                 rt += d.content
>> "!GEN!" echo                             else:
>> "!GEN!" echo                                 print(Fore.YELLOW + '\\n[INFO] Non-text response (' + type(d.content).__name__ + '). Try another.\\n' + Style.RESET_ALL)
>> "!GEN!" echo                                 return
>> "!GEN!" echo                 print()
>> "!GEN!" echo                 hist.append({'role':'assistant', 'content':rt})
>> "!GEN!" echo             except Exception as e: print(Fore.RED + '[ERROR] ' + str(e) + Style.RESET_ALL)
>> "!GEN!" echo         except KeyboardInterrupt: return
>> "!GEN!" echo def main():
>> "!GEN!" echo     os.system('cls')
>> "!GEN!" echo     print(Fore.CYAN + '  CLAUDE HUNT' + Style.RESET_ALL)
>> "!GEN!" echo     print('  Proxy: ' + PROXY_STATUS)
>> "!GEN!" echo     claude_models = ['claude-3-5-sonnet', 'claude-3-opus', 'claude-3-sonnet', 'claude-3-haiku', 'claude-sonnet-4-20250514', 'claude-3-7-sonnet']
>> "!GEN!" echo     providers = get_providers()
>> "!GEN!" echo     working = []
>> "!GEN!" echo     for pname in providers:
>> "!GEN!" echo         if check_q(): break
>> "!GEN!" echo         pc = getattr(g4f.Provider, pname, None)
>> "!GEN!" echo         if pc is None: continue
>> "!GEN!" echo         for model in claude_models:
>> "!GEN!" echo             if check_q(): break
>> "!GEN!" echo             label = pname + ' / ' + model
>> "!GEN!" echo             print('  ' + label.ljust(50), end='', flush=True)
>> "!GEN!" echo             try:
>> "!GEN!" echo                 client = Client(proxy=PROXY)
>> "!GEN!" echo                 client.chat.completions.create(model=model, provider=pc, messages=[{'role':'user','content':'Hi'}], max_tokens=3)
>> "!GEN!" echo                 print(Fore.GREEN + ' [FOUND]' + Style.RESET_ALL)
>> "!GEN!" echo                 working.append((pname, model, pc))
>> "!GEN!" echo                 break
>> "!GEN!" echo             except Exception: print(Fore.RED + ' [X]' + Style.RESET_ALL)
>> "!GEN!" echo     if working:
>> "!GEN!" echo         with open(CACHE_FILE, 'w', encoding='utf-8') as f:
>> "!GEN!" echo             for p, m, _ in working: f.write(p + '~' + m + '\\n')
>> "!GEN!" echo     print('  Found: ' + Fore.GREEN + str(len(working)) + Style.RESET_ALL)
>> "!GEN!" echo     if not working: input('Press Enter...'); return
>> "!GEN!" echo     while True:
>> "!GEN!" echo         for i, (p, m, _) in enumerate(working, 1): print('  [' + str(i) + '] ' + p + ' / ' + m)
>> "!GEN!" echo         print('  [0] Back')
>> "!GEN!" echo         c = input('  Select: ').strip()
>> "!GEN!" echo         if c == '0': return
>> "!GEN!" echo         try: chat(working[int(c)-1][0], working[int(c)-1][1], working[int(c)-1][2])
>> "!GEN!" echo         except: pass
>> "!GEN!" echo if __name__ == '__main__': main()
>> "!GEN!" echo '''
>> "!GEN!" echo w('claude_hunt.py', claude)
>> "!GEN!" echo gpt5 = H + '''
>> "!GEN!" echo CACHE_FILE = os.path.join(SCRIPTS_DIR, 'cache_gpt5.txt')
>> "!GEN!" echo def get_providers():
>> "!GEN!" echo     names = []
>> "!GEN!" echo     blacklist = {'Bing', 'HuggingChat', 'PerplexityLabs', 'You', 'PerplexityAI', 'Pi', 'Bard', 'OpenaiChat', 'Gemini', 'HuggingFace', 'Vercel', 'Raycast', 'DeepInfraChat', 'Cloudflare', 'AiChatOnline', 'ChatGLM', 'Cerebras'}
>> "!GEN!" echo     blacklist_kw = ['image', 'flux', 'stable', 'pollin', 'sdxl', 'sd3', 'dalle', 'midjourney', 'media']
>> "!GEN!" echo     for n in dir(g4f.Provider):
>> "!GEN!" echo         if n.startswith('_') or not n[0].isupper(): continue
>> "!GEN!" echo         if n in blacklist: continue
>> "!GEN!" echo         if any(kw in n.lower() for kw in blacklist_kw): continue
>> "!GEN!" echo         obj = getattr(g4f.Provider, n, None)
>> "!GEN!" echo         if obj is None: continue
>> "!GEN!" echo         if hasattr(obj, 'needs_auth') and obj.needs_auth: continue
>> "!GEN!" echo         names.append(n)
>> "!GEN!" echo     return names
>> "!GEN!" echo def chat(pname, model, pc):
>> "!GEN!" echo     client = Client(proxy=PROXY)
>> "!GEN!" echo     hist = [{'role':'system','content':'Expert AI. Reply Thai. Complete code.'}]
>> "!GEN!" echo     os.system('cls')
>> "!GEN!" echo     print('  NEXT-GEN: ' + pname + ' / ' + model)
>> "!GEN!" echo     while True:
>> "!GEN!" echo         try:
>> "!GEN!" echo             ui = input(Fore.GREEN + '^> You: ' + Style.RESET_ALL).strip()
>> "!GEN!" echo             if not ui: continue
>> "!GEN!" echo             if ui.lower() in ['exit', 'quit', 'q']: return
>> "!GEN!" echo             hist.append({'role':'user', 'content':ui})
>> "!GEN!" echo             try:
>> "!GEN!" echo                 rt = ''
>> "!GEN!" echo                 stream = client.chat.completions.create(model=model, provider=pc, messages=hist, temperature=0.3, max_tokens=4096, stream=True)
>> "!GEN!" echo                 for ch in stream:
>> "!GEN!" echo                     if check_q(): return
>> "!GEN!" echo                     if hasattr(ch, 'choices') and ch.choices:
>> "!GEN!" echo                         d = ch.choices[0].delta
>> "!GEN!" echo                         if hasattr(d, 'content') and d.content:
>> "!GEN!" echo                             if isinstance(d.content, str):
>> "!GEN!" echo                                 print(d.content, end='', flush=True)
>> "!GEN!" echo                                 rt += d.content
>> "!GEN!" echo                             else:
>> "!GEN!" echo                                 print(Fore.YELLOW + '\\n[INFO] Non-text response. Try another.\\n' + Style.RESET_ALL)
>> "!GEN!" echo                                 return
>> "!GEN!" echo                 print()
>> "!GEN!" echo                 hist.append({'role':'assistant', 'content':rt})
>> "!GEN!" echo             except Exception as e: print(Fore.RED + '[ERROR] ' + str(e) + Style.RESET_ALL)
>> "!GEN!" echo         except KeyboardInterrupt: return
>> "!GEN!" echo def main():
>> "!GEN!" echo     os.system('cls')
>> "!GEN!" echo     print(Fore.CYAN + '  GPT-5.6 / NEXT-GEN MODELS HUNT' + Style.RESET_ALL)
>> "!GEN!" echo     print('  Proxy: ' + PROXY_STATUS)
>> "!GEN!" echo     next_gen_models = ['gpt-5', 'gpt-5.6-luna', 'gpt-5.6-sol', 'gpt-5-turbo', 'o1', 'o1-mini', 'o1-preview', 'o3', 'o3-mini', 'gpt-4o', 'gpt-4o-mini', 'gpt-4-turbo', 'claude-3.7-sonnet', 'claude-3.5-sonnet', 'claude-3-opus', 'deepseek-ai/DeepSeek-V3', 'deepseek-ai/DeepSeek-R1', 'meta-llama/Llama-3.3-70B-Instruct', 'Qwen/Qwen2.5-72B-Instruct']
>> "!GEN!" echo     providers = get_providers()
>> "!GEN!" echo     working = []
>> "!GEN!" echo     for pname in providers:
>> "!GEN!" echo         if check_q(): break
>> "!GEN!" echo         pc = getattr(g4f.Provider, pname, None)
>> "!GEN!" echo         if pc is None: continue
>> "!GEN!" echo         for model in next_gen_models:
>> "!GEN!" echo             if check_q(): break
>> "!GEN!" echo             label = pname + ' / ' + model
>> "!GEN!" echo             print('  ' + label.ljust(55), end='', flush=True)
>> "!GEN!" echo             try:
>> "!GEN!" echo                 client = Client(proxy=PROXY)
>> "!GEN!" echo                 client.chat.completions.create(model=model, provider=pc, messages=[{'role':'user','content':'Hi'}], max_tokens=3)
>> "!GEN!" echo                 print(Fore.GREEN + ' [OK]' + Style.RESET_ALL)
>> "!GEN!" echo                 working.append((pname, model, pc))
>> "!GEN!" echo                 break
>> "!GEN!" echo             except Exception: print(Fore.RED + ' [X]' + Style.RESET_ALL)
>> "!GEN!" echo     if working:
>> "!GEN!" echo         with open(CACHE_FILE, 'w', encoding='utf-8') as f:
>> "!GEN!" echo             for p, m, _ in working: f.write(p + '~' + m + '\\n')
>> "!GEN!" echo     print('  Found: ' + Fore.GREEN + str(len(working)) + Style.RESET_ALL)
>> "!GEN!" echo     if not working: input('Press Enter...'); return
>> "!GEN!" echo     while True:
>> "!GEN!" echo         for i, (p, m, _) in enumerate(working, 1): print('  [' + str(i) + '] ' + p + ' / ' + m)
>> "!GEN!" echo         print('  [0] Back')
>> "!GEN!" echo         c = input('  Select: ').strip()
>> "!GEN!" echo         if c == '0': return
>> "!GEN!" echo         try: chat(working[int(c)-1][0], working[int(c)-1][1], working[int(c)-1][2])
>> "!GEN!" echo         except: pass
>> "!GEN!" echo if __name__ == '__main__': main()
>> "!GEN!" echo '''
>> "!GEN!" echo w('gpt5_scan.py', gpt5)
>> "!GEN!" echo nvidia = '''import sys, os
>> "!GEN!" echo _CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))
>> "!GEN!" echo sys.path.insert(0, _CURRENT_DIR)
>> "!GEN!" echo from paths import BASE_DIR, SCRIPTS_DIR, PYTHON_DIR, CONFIG_FILE, PROXIES_FILE, CUSTOM_APIS_FILE
>> "!GEN!" echo sys.path.insert(0, os.path.join(PYTHON_DIR, 'Lib', 'site-packages'))
>> "!GEN!" echo os.chdir(SCRIPTS_DIR)
>> "!GEN!" echo import warnings, logging
>> "!GEN!" echo warnings.filterwarnings('ignore')
>> "!GEN!" echo logging.getLogger('openai').setLevel(logging.CRITICAL)
>> "!GEN!" echo try:
>> "!GEN!" echo     from colorama import init, Fore, Style
>> "!GEN!" echo     init(autoreset=True)
>> "!GEN!" echo     from openai import OpenAI
>> "!GEN!" echo     import requests
>> "!GEN!" echo except Exception as e: print('[ERROR] ' + str(e)); input('Press Enter...'); sys.exit(1)
>> "!GEN!" echo def read_config():
>> "!GEN!" echo     c = {}
>> "!GEN!" echo     try:
>> "!GEN!" echo         with open(CONFIG_FILE, 'r') as f:
>> "!GEN!" echo             for l in f:
>> "!GEN!" echo                 l = l.strip()
>> "!GEN!" echo                 if '=' in l and not l.startswith('['): k, v = l.split('=', 1); c[k.strip()] = v.strip()
>> "!GEN!" echo     except: pass
>> "!GEN!" echo     return c
>> "!GEN!" echo def chat(model):
>> "!GEN!" echo     cfg = read_config()
>> "!GEN!" echo     client = OpenAI(api_key=cfg.get('API_KEY', ''), base_url='https://integrate.api.nvidia.com/v1', timeout=20.0)
>> "!GEN!" echo     hist = [{'role':'system','content':'Expert AI. Reply Thai.'}]
>> "!GEN!" echo     os.system('cls')
>> "!GEN!" echo     print('  NVIDIA - ' + model)
>> "!GEN!" echo     while True:
>> "!GEN!" echo         ui = input(Fore.GREEN + '^> You: ' + Style.RESET_ALL).strip()
>> "!GEN!" echo         if not ui: continue
>> "!GEN!" echo         if ui.lower() in ['exit', 'quit', 'q']: return
>> "!GEN!" echo         hist.append({'role':'user', 'content':ui})
>> "!GEN!" echo         try:
>> "!GEN!" echo             rt = ''
>> "!GEN!" echo             stream = client.chat.completions.create(model=model, messages=hist, temperature=0.3, max_tokens=4096, stream=True)
>> "!GEN!" echo             for ch in stream:
>> "!GEN!" echo                 if ch.choices and ch.choices[0].delta.content: print(ch.choices[0].delta.content, end='', flush=True); rt += ch.choices[0].delta.content
>> "!GEN!" echo             print(); hist.append({'role':'assistant', 'content':rt})
>> "!GEN!" echo         except Exception as e: print(Fore.RED + '[ERROR] ' + str(e))
>> "!GEN!" echo def main():
>> "!GEN!" echo     cfg = read_config()
>> "!GEN!" echo     key = cfg.get('API_KEY', '')
>> "!GEN!" echo     if not key or key == 'your_nvidia_api_key_here': print(Fore.RED + '[ERROR] Set API Key first (menu 7)'); input('Press Enter...'); return
>> "!GEN!" echo     client = OpenAI(api_key=key, base_url='https://integrate.api.nvidia.com/v1', timeout=20.0)
>> "!GEN!" echo     os.system('cls')
>> "!GEN!" echo     print('  Fetching Nvidia models... (Timeout 20s)')
>> "!GEN!" echo     try: models = [m.id for m in client.models.list().data]
>> "!GEN!" echo     except Exception as e:
>> "!GEN!" echo         print('  [WARN] Fetch failed: ' + str(e))
>> "!GEN!" echo         models = ['meta/llama-3.1-70b-instruct', 'meta/llama-3.1-405b-instruct', 'deepseek-ai/deepseek-r1']
>> "!GEN!" echo     working = []
>> "!GEN!" echo     for m in models:
>> "!GEN!" echo         print('  Testing: ' + m, end='', flush=True)
>> "!GEN!" echo         try:
>> "!GEN!" echo             client.chat.completions.create(model=m, messages=[{'role':'user','content':'Hi'}], max_tokens=2)
>> "!GEN!" echo             print(' [OK]')
>> "!GEN!" echo             working.append(m)
>> "!GEN!" echo         except Exception as e:
>> "!GEN!" echo             print(' [X]')
>> "!GEN!" echo     if working:
>> "!GEN!" echo         with open(os.path.join(SCRIPTS_DIR, 'cache_nvidia.txt'), 'w') as f:
>> "!GEN!" echo             for m in working: f.write(m + '\\n')
>> "!GEN!" echo     for i, m in enumerate(working, 1): print('  [' + str(i) + '] ' + m)
>> "!GEN!" echo     print('  [0] Back')
>> "!GEN!" echo     c = input('  Select: ').strip()
>> "!GEN!" echo     if c == '0': return
>> "!GEN!" echo     try: chat(working[int(c)-1])
>> "!GEN!" echo     except: pass
>> "!GEN!" echo if __name__ == '__main__': main()
>> "!GEN!" echo '''
>> "!GEN!" echo w('nvidia_scan.py', nvidia)
>> "!GEN!" echo secret = H + '''
>> "!GEN!" echo CACHE_FILE = os.path.join(SCRIPTS_DIR, 'cache_secret.txt')
>> "!GEN!" echo def get_providers():
>> "!GEN!" echo     names = []
>> "!GEN!" echo     blacklist = {'Bing', 'DuckDuckGo', 'HuggingChat', 'PerplexityLabs', 'You', 'PerplexityAI', 'Pi', 'Bard', 'OpenaiChat', 'Gemini', 'HuggingFace', 'Vercel', 'Raycast', 'DeepInfraChat', 'Cloudflare', 'AiChatOnline', 'ChatGLM', 'Cerebras'}
>> "!GEN!" echo     blacklist_kw = ['image', 'flux', 'stable', 'pollin', 'sdxl', 'sd3', 'dalle', 'midjourney', 'media']
>> "!GEN!" echo     for n in dir(g4f.Provider):
>> "!GEN!" echo         if n.startswith('_') or not n[0].isupper(): continue
>> "!GEN!" echo         if n in blacklist: continue
>> "!GEN!" echo         if any(kw in n.lower() for kw in blacklist_kw): continue
>> "!GEN!" echo         obj = getattr(g4f.Provider, n, None)
>> "!GEN!" echo         if obj is None: continue
>> "!GEN!" echo         if hasattr(obj, 'needs_auth') and obj.needs_auth: continue
>> "!GEN!" echo         names.append(n)
>> "!GEN!" echo     return names
>> "!GEN!" echo def chat(pname, model, pc):
>> "!GEN!" echo     client = Client(proxy=PROXY)
>> "!GEN!" echo     hist = [{'role':'system','content':'Expert coding. Reply Thai.'}]
>> "!GEN!" echo     os.system('cls')
>> "!GEN!" echo     print('  ' + pname + ' / ' + model)
>> "!GEN!" echo     while True:
>> "!GEN!" echo         ui = input(Fore.GREEN + '^> You: ' + Style.RESET_ALL).strip()
>> "!GEN!" echo         if not ui: continue
>> "!GEN!" echo         if ui.lower() in ['exit', 'quit', 'q']: return
>> "!GEN!" echo         hist.append({'role':'user', 'content':ui})
>> "!GEN!" echo         try:
>> "!GEN!" echo             rt = ''
>> "!GEN!" echo             stream = client.chat.completions.create(model=model, provider=pc, messages=hist, temperature=0.3, max_tokens=4096, stream=True)
>> "!GEN!" echo             for ch in stream:
>> "!GEN!" echo                 if check_q(): return
>> "!GEN!" echo                 if hasattr(ch, 'choices') and ch.choices:
>> "!GEN!" echo                     d = ch.choices[0].delta
>> "!GEN!" echo                     if hasattr(d, 'content') and d.content:
>> "!GEN!" echo                         if isinstance(d.content, str):
>> "!GEN!" echo                             print(d.content, end='', flush=True)
>> "!GEN!" echo                             rt += d.content
>> "!GEN!" echo                         else:
>> "!GEN!" echo                             print(Fore.YELLOW + '\\n[INFO] Non-text response (' + type(d.content).__name__ + '). Try another.\\n' + Style.RESET_ALL)
>> "!GEN!" echo                             return
>> "!GEN!" echo             print(); hist.append({'role':'assistant', 'content':rt})
>> "!GEN!" echo         except Exception as e: print(Fore.RED + '[ERROR] ' + str(e))
>> "!GEN!" echo def main(tool_num):
>> "!GEN!" echo     tool_models = {'1': ['deepseek-ai/deepseek-coder-33b-instruct', 'deepseek-ai/DeepSeek-V3'], '2': ['codellama-34b', 'codellama-70b'], '3': ['wizardcoder-34b', 'microsoft/WizardLM-2-8x22B'], '4': ['Qwen/Qwen2.5-Coder-32B-Instruct', 'Qwen/Qwen2.5-72B-Instruct'], '5': ['phind-codellama-34b', 'gpt-4'], '6': ['mistralai/Codestral-22B-v0.1', 'mistralai/Mistral-Large-Instruct-2407']}
>> "!GEN!" echo     target = tool_models.get(tool_num, [])
>> "!GEN!" echo     if not target: print('Invalid tool'); input('Press Enter...'); return
>> "!GEN!" echo     os.system('cls')
>> "!GEN!" echo     providers = get_providers()
>> "!GEN!" echo     working = []
>> "!GEN!" echo     for pname in providers[:20]:
>> "!GEN!" echo         if check_q(): break
>> "!GEN!" echo         pc = getattr(g4f.Provider, pname, None)
>> "!GEN!" echo         if pc is None: continue
>> "!GEN!" echo         for model in target:
>> "!GEN!" echo             if check_q(): break
>> "!GEN!" echo             label = pname + ' / ' + model[:30]
>> "!GEN!" echo             print('  ' + label.ljust(50), end='', flush=True)
>> "!GEN!" echo             try:
>> "!GEN!" echo                 client = Client(proxy=PROXY)
>> "!GEN!" echo                 client.chat.completions.create(model=model, provider=pc, messages=[{'role':'user','content':'Hi'}], max_tokens=3)
>> "!GEN!" echo                 print(Fore.GREEN + ' [FOUND]' + Style.RESET_ALL)
>> "!GEN!" echo                 working.append((pname, model, pc))
>> "!GEN!" echo                 break
>> "!GEN!" echo             except Exception: print(Fore.RED + ' [X]' + Style.RESET_ALL)
>> "!GEN!" echo     if working:
>> "!GEN!" echo         with open(CACHE_FILE, 'w', encoding='utf-8') as f:
>> "!GEN!" echo             for p, m, _ in working: f.write(p + '~' + m + '\\n')
>> "!GEN!" echo     print('  Found: ' + Fore.GREEN + str(len(working)) + Style.RESET_ALL)
>> "!GEN!" echo     if not working: input('Press Enter...'); return
>> "!GEN!" echo     while True:
>> "!GEN!" echo         for i, (p, m, _) in enumerate(working, 1): print('  [' + str(i) + '] ' + p + ' / ' + m)
>> "!GEN!" echo         print('  [0] Back')
>> "!GEN!" echo         c = input('  Select: ').strip()
>> "!GEN!" echo         if c == '0': return
>> "!GEN!" echo         try: chat(working[int(c)-1][0], working[int(c)-1][1], working[int(c)-1][2])
>> "!GEN!" echo         except: pass
>> "!GEN!" echo if __name__ == '__main__':
>> "!GEN!" echo     import sys as _sys
>> "!GEN!" echo     if len(_sys.argv) ^> 1: main(_sys.argv[1])
>> "!GEN!" echo '''
>> "!GEN!" echo w('secret_tools.py', secret)
>> "!GEN!" echo file_analyzer = H + '''
>> "!GEN!" echo def main():
>> "!GEN!" echo     os.system('cls')
>> "!GEN!" echo     print(Fore.CYAN + '  --- FILE ANALYZER (DEEP CODE REVIEW) ---' + Style.RESET_ALL)
>> "!GEN!" echo     workers = load_workers()
>> "!GEN!" echo     if not workers:
>> "!GEN!" echo         print(Fore.RED + '  No working provider in cache. Run Quantum/GPT scan first.' + Style.RESET_ALL)
>> "!GEN!" echo         input()
>> "!GEN!" echo         return
>> "!GEN!" echo     for i,(p,m) in enumerate(workers,1): print('  [' + str(i) + '] ' + p + ' / ' + m)
>> "!GEN!" echo     c = input('  Select AI provider: ').strip()
>> "!GEN!" echo     try: idx=int(c)-1
>> "!GEN!" echo     except Exception: return
>> "!GEN!" echo     if idx ^< 0 or idx ^>= len(workers): return
>> "!GEN!" echo     pname,model=workers[idx]
>> "!GEN!" echo     pc=getattr(g4f.Provider,pname,None)
>> "!GEN!" echo     if pc is None: print('Provider not found'); input(); return
>> "!GEN!" echo     path = input('  Enter full path to file: ').strip().strip('"')
>> "!GEN!" echo     if not os.path.exists(path): print(Fore.RED + '  [ERROR] File not found.' + Style.RESET_ALL); input(); return
>> "!GEN!" echo     try:
>> "!GEN!" echo         with open(path, 'r', encoding='utf-8', errors='ignore') as f: content = f.read()
>> "!GEN!" echo     except Exception as e: print(Fore.RED + '  [ERROR] ' + str(e) + Style.RESET_ALL); input(); return
>> "!GEN!" echo     print('  Read ' + str(len(content)) + ' chars from ' + os.path.basename(path))
>> "!GEN!" echo     if len(content) ^> 100000:
>> "!GEN!" echo         print(Fore.YELLOW + '  [INFO] File is very large. Truncating to 100k chars.' + Style.RESET_ALL)
>> "!GEN!" echo         content = content[:100000]
>> "!GEN!" echo     prompt = 'You are an Expert AI Code Reviewer. Analyze this code deeply.\\n1. Find bugs, logic errors, security flaws.\\n2. Suggest optimizations.\\n3. Provide refactored code.\\n4. Reply in Thai.\\n\\nCode:\\n' + content
>> "!GEN!" echo     hist = [{'role':'system', 'content':'Expert AI Code Reviewer. Reply Thai.'}, {'role':'user', 'content': prompt}]
>> "!GEN!" echo     print('\\n  Analyzing... (Press Q to stop)\\n')
>> "!GEN!" echo     client = Client(proxy=PROXY)
>> "!GEN!" echo     try:
>> "!GEN!" echo         stream = client.chat.completions.create(model=model, provider=pc, messages=hist, temperature=0.2, max_tokens=4096, stream=True)
>> "!GEN!" echo         for ch_s in stream:
>> "!GEN!" echo             if check_q(): break
>> "!GEN!" echo             if hasattr(ch_s, 'choices') and ch_s.choices:
>> "!GEN!" echo                 d = ch_s.choices[0].delta
>> "!GEN!" echo                 if hasattr(d, 'content') and d.content and isinstance(d.content, str):
>> "!GEN!" echo                     print(d.content, end='', flush=True)
>> "!GEN!" echo         print('\\n\\n  --- Analysis Complete ---')
>> "!GEN!" echo     except Exception as e: print(Fore.RED + '[ERROR] ' + str(e) + Style.RESET_ALL)
>> "!GEN!" echo     input('\\n  Press Enter to return...')
>> "!GEN!" echo if __name__ == '__main__': main()
>> "!GEN!" echo '''
>> "!GEN!" echo w('file_analyzer.py', file_analyzer)
>> "!GEN!" echo cache_chat = '''import sys, os, warnings, logging
>> "!GEN!" echo warnings.filterwarnings('ignore')
>> "!GEN!" echo logging.getLogger('aiohttp').setLevel(logging.CRITICAL)
>> "!GEN!" echo logging.getLogger('asyncio').setLevel(logging.CRITICAL)
>> "!GEN!" echo _CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))
>> "!GEN!" echo sys.path.insert(0, _CURRENT_DIR)
>> "!GEN!" echo from paths import BASE_DIR, SCRIPTS_DIR, PYTHON_DIR, CONFIG_FILE, PROXIES_FILE, CUSTOM_APIS_FILE
>> "!GEN!" echo if not os.path.exists(SCRIPTS_DIR): os.makedirs(SCRIPTS_DIR)
>> "!GEN!" echo os.chdir(SCRIPTS_DIR)
>> "!GEN!" echo sys.path.insert(0, os.path.join(PYTHON_DIR, 'Lib', 'site-packages'))
>> "!GEN!" echo try:
>> "!GEN!" echo     from colorama import init, Fore, Style
>> "!GEN!" echo     init(autoreset=True)
>> "!GEN!" echo     import g4f
>> "!GEN!" echo     from g4f.client import Client
>> "!GEN!" echo     from openai import OpenAI
>> "!GEN!" echo except Exception as e: print('[ERROR] ' + str(e)); input(); sys.exit(1)
>> "!GEN!" echo def read_config():
>> "!GEN!" echo     c = {}
>> "!GEN!" echo     try:
>> "!GEN!" echo         with open(CONFIG_FILE, 'r') as f:
>> "!GEN!" echo             for l in f:
>> "!GEN!" echo                 l = l.strip()
>> "!GEN!" echo                 if '=' in l and not l.startswith('['): k, v = l.split('=', 1); c[k.strip()] = v.strip()
>> "!GEN!" echo     except: pass
>> "!GEN!" echo     return c
>> "!GEN!" echo mode = sys.argv[1] if len(sys.argv) ^> 1 else '1'
>> "!GEN!" echo files = {'1': (os.path.join(SCRIPTS_DIR, 'cache_quantum.txt'), 'Quantum'), '2': (os.path.join(SCRIPTS_DIR, 'cache_claude.txt'), 'Claude'), '3': (os.path.join(SCRIPTS_DIR, 'cache_nvidia.txt'), 'Nvidia'), '4': (os.path.join(SCRIPTS_DIR, 'cache_secret.txt'), 'Secret'), '5': (os.path.join(SCRIPTS_DIR, 'cache_gpt5.txt'), 'GPT-5/Next-Gen'), '6': (os.path.join(SCRIPTS_DIR, 'cache_custom.txt'), 'Custom API')}
>> "!GEN!" echo if mode not in files: sys.exit()
>> "!GEN!" echo filepath, name = files[mode]
>> "!GEN!" echo if not os.path.exists(filepath): print('  [ERROR] ' + name + ' cache not found. Scan first.'); input(); sys.exit()
>> "!GEN!" echo with open(filepath, 'r', encoding='utf-8') as f: lines = [l.strip() for l in f if l.strip()]
>> "!GEN!" echo if not lines: print('  Cache is empty.'); input(); sys.exit()
>> "!GEN!" echo os.system('cls')
>> "!GEN!" echo print('  --- ' + name + ' Cache (' + str(len(lines)) + ' items) ---')
>> "!GEN!" echo for i, l in enumerate(lines, 1): print('  [' + str(i) + '] ' + l)
>> "!GEN!" echo print('  [0] Back')
>> "!GEN!" echo c = input('  Select to Chat: ').strip()
>> "!GEN!" echo if not c.isdigit() or not (1 ^<= int(c) ^<= len(lines)): sys.exit()
>> "!GEN!" echo sel = lines[int(c)-1]
>> "!GEN!" echo def chat_g4f(pname, model):
>> "!GEN!" echo     pc = getattr(g4f.Provider, pname, None)
>> "!GEN!" echo     if not pc: print('Provider not found'); return
>> "!GEN!" echo     client = Client()
>> "!GEN!" echo     hist = [{'role':'system','content':'Expert AI. Reply Thai.'}]
>> "!GEN!" echo     os.system('cls')
>> "!GEN!" echo     print('  ' + pname + ' / ' + model)
>> "!GEN!" echo     while True:
>> "!GEN!" echo         ui = input(Fore.GREEN + '^> You: ' + Style.RESET_ALL).strip()
>> "!GEN!" echo         if not ui: continue
>> "!GEN!" echo         if ui.lower() in ['q','exit','quit']: return
>> "!GEN!" echo         hist.append({'role':'user','content':ui})
>> "!GEN!" echo         try:
>> "!GEN!" echo             stream = client.chat.completions.create(model=model, provider=pc, messages=hist, max_tokens=4096, stream=True)
>> "!GEN!" echo             rt = ''
>> "!GEN!" echo             for ch in stream:
>> "!GEN!" echo                 if hasattr(ch, 'choices') and ch.choices:
>> "!GEN!" echo                     d = ch.choices[0].delta
>> "!GEN!" echo                     if hasattr(d, 'content') and d.content:
>> "!GEN!" echo                         if isinstance(d.content, str): print(d.content, end='', flush=True); rt += d.content
>> "!GEN!" echo                         else: print(Fore.YELLOW + '\\n[INFO] Non-text (' + type(d.content).__name__ + ')\\n' + Style.RESET_ALL); return
>> "!GEN!" echo             print(); hist.append({'role':'assistant','content':rt})
>> "!GEN!" echo         except Exception as e: print(Fore.RED + '[ERROR] ' + str(e))
>> "!GEN!" echo def chat_nvidia(model):
>> "!GEN!" echo     cfg = read_config()
>> "!GEN!" echo     key = cfg.get('API_KEY','')
>> "!GEN!" echo     if not key or key == 'your_nvidia_api_key_here': print('Set Nvidia Key first'); return
>> "!GEN!" echo     client = OpenAI(api_key=key, base_url='https://integrate.api.nvidia.com/v1', timeout=20.0)
>> "!GEN!" echo     hist = [{'role':'system','content':'Expert AI. Reply Thai.'}]
>> "!GEN!" echo     os.system('cls')
>> "!GEN!" echo     print('  NVIDIA / ' + model)
>> "!GEN!" echo     while True:
>> "!GEN!" echo         ui = input(Fore.GREEN + '^> You: ' + Style.RESET_ALL).strip()
>> "!GEN!" echo         if not ui: continue
>> "!GEN!" echo         if ui.lower() in ['q','exit','quit']: return
>> "!GEN!" echo         hist.append({'role':'user','content':ui})
>> "!GEN!" echo         try:
>> "!GEN!" echo             stream = client.chat.completions.create(model=model, messages=hist, max_tokens=4096, stream=True)
>> "!GEN!" echo             rt = ''
>> "!GEN!" echo             for ch in stream:
>> "!GEN!" echo                 if ch.choices and ch.choices[0].delta.content: print(ch.choices[0].delta.content, end='', flush=True); rt += ch.choices[0].delta.content
>> "!GEN!" echo             print(); hist.append({'role':'assistant','content':rt})
>> "!GEN!" echo         except Exception as e: print(Fore.RED + '[ERROR] ' + str(e))
>> "!GEN!" echo def chat_custom(name, url, key, model):
>> "!GEN!" echo     client = OpenAI(api_key=key, base_url=url, timeout=20.0)
>> "!GEN!" echo     hist = [{'role':'system','content':'Expert AI. Reply Thai.'}]
>> "!GEN!" echo     os.system('cls')
>> "!GEN!" echo     print('  ' + name + ' / ' + model)
>> "!GEN!" echo     while True:
>> "!GEN!" echo         ui = input(Fore.GREEN + '^> You: ' + Style.RESET_ALL).strip()
>> "!GEN!" echo         if not ui: continue
>> "!GEN!" echo         if ui.lower() in ['q','exit','quit']: return
>> "!GEN!" echo         hist.append({'role':'user','content':ui})
>> "!GEN!" echo         try:
>> "!GEN!" echo             stream = client.chat.completions.create(model=model, messages=hist, max_tokens=4096, stream=True)
>> "!GEN!" echo             rt = ''
>> "!GEN!" echo             for ch in stream:
>> "!GEN!" echo                 if ch.choices and ch.choices[0].delta.content: print(ch.choices[0].delta.content, end='', flush=True); rt += ch.choices[0].delta.content
>> "!GEN!" echo             print(); hist.append({'role':'assistant','content':rt})
>> "!GEN!" echo         except Exception as e: print(Fore.RED + '[ERROR] ' + str(e))
>> "!GEN!" echo if mode == '3': chat_nvidia(sel)
>> "!GEN!" echo elif mode == '6':
>> "!GEN!" echo     parts = sel.split('~', 3)
>> "!GEN!" echo     if len(parts) == 4: chat_custom(parts[0], parts[1], parts[2], parts[3])
>> "!GEN!" echo else:
>> "!GEN!" echo     p, m = sel.split('~', 1)
>> "!GEN!" echo     chat_g4f(p, m)
>> "!GEN!" echo '''
>> "!GEN!" echo w('cache_chat.py', cache_chat)
>> "!GEN!" echo custom_api = '''import sys, os, warnings, logging
>> "!GEN!" echo warnings.filterwarnings('ignore')
>> "!GEN!" echo logging.getLogger('openai').setLevel(logging.CRITICAL)
>> "!GEN!" echo _CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))
>> "!GEN!" echo sys.path.insert(0, _CURRENT_DIR)
>> "!GEN!" echo from paths import BASE_DIR, SCRIPTS_DIR, PYTHON_DIR, CONFIG_FILE, PROXIES_FILE, CUSTOM_APIS_FILE
>> "!GEN!" echo if not os.path.exists(SCRIPTS_DIR): os.makedirs(SCRIPTS_DIR)
>> "!GEN!" echo os.chdir(SCRIPTS_DIR)
>> "!GEN!" echo sys.path.insert(0, os.path.join(PYTHON_DIR, 'Lib', 'site-packages'))
>> "!GEN!" echo from colorama import init, Fore, Style
>> "!GEN!" echo init(autoreset=True)
>> "!GEN!" echo from openai import OpenAI
>> "!GEN!" echo FILE = CUSTOM_APIS_FILE
>> "!GEN!" echo CACHE_FILE = os.path.join(SCRIPTS_DIR, 'cache_custom.txt')
>> "!GEN!" echo def load():
>> "!GEN!" echo     if not os.path.exists(FILE): return []
>> "!GEN!" echo     with open(FILE, 'r', encoding='utf-8') as f: return [l.strip().split('~', 3) for l in f if l.strip() and '~' in l]
>> "!GEN!" echo def save(data):
>> "!GEN!" echo     with open(FILE, 'w', encoding='utf-8') as f:
>> "!GEN!" echo         for d in data: f.write('~'.join(d) + '\\n')
>> "!GEN!" echo def save_cache(name, url, key, model):
>> "!GEN!" echo     with open(CACHE_FILE, 'a', encoding='utf-8') as f: f.write(name + '~' + url + '~' + key + '~' + model + '\\n')
>> "!GEN!" echo def scan_models(url, key):
>> "!GEN!" echo     try:
>> "!GEN!" echo         client = OpenAI(api_key=key, base_url=url, timeout=15.0)
>> "!GEN!" echo         models = [m.id for m in client.models.list().data]
>> "!GEN!" echo         return models
>> "!GEN!" echo     except Exception as e:
>> "!GEN!" echo         print(Fore.RED + '  [ERROR] ' + str(e) + Style.RESET_ALL)
>> "!GEN!" echo         return []
>> "!GEN!" echo def add_new():
>> "!GEN!" echo     if len(load()) ^>= 10: print('  Max 10 APIs.'); input(); return
>> "!GEN!" echo     n = input('  Name (e.g. Groq): ').strip()
>> "!GEN!" echo     u = input('  Base URL (e.g. https://api...): ').strip()
>> "!GEN!" echo     k = input('  API Key: ').strip()
>> "!GEN!" echo     if not (n and u and k): return
>> "!GEN!" echo     print('  Scanning available models...')
>> "!GEN!" echo     models = scan_models(u, k)
>> "!GEN!" echo     if not models:
>> "!GEN!" echo         print(Fore.RED + '  No models found or connection failed.' + Style.RESET_ALL)
>> "!GEN!" echo         input(); return
>> "!GEN!" echo     print(Fore.GREEN + '  Found ' + str(len(models)) + ' models:' + Style.RESET_ALL)
>> "!GEN!" echo     for i, m in enumerate(models, 1): print('  [' + str(i) + '] ' + m)
>> "!GEN!" echo     sel = input('  Select model #: ').strip()
>> "!GEN!" echo     if not sel.isdigit() or not (1 ^<= int(sel) ^<= len(models)):
>> "!GEN!" echo         print('  Invalid selection.'); input(); return
>> "!GEN!" echo     chosen = models[int(sel)-1]
>> "!GEN!" echo     data = load()
>> "!GEN!" echo     data.append([n, u, k, chosen])
>> "!GEN!" echo     save(data)
>> "!GEN!" echo     save_cache(n, u, k, chosen)
>> "!GEN!" echo     print(Fore.GREEN + '  Saved: ' + n + ' / ' + chosen + Style.RESET_ALL)
>> "!GEN!" echo     input()
>> "!GEN!" echo def rescan():
>> "!GEN!" echo     data = load()
>> "!GEN!" echo     idx = input('  Re-scan #: ').strip()
>> "!GEN!" echo     if idx.isdigit() and 1 ^<= int(idx) ^<= len(data):
>> "!GEN!" echo         d = data[int(idx)-1]
>> "!GEN!" echo         print('  Scanning for ' + d[0] + '...')
>> "!GEN!" echo         models = scan_models(d[1], d[2])
>> "!GEN!" echo         if models:
>> "!GEN!" echo             print(Fore.GREEN + '  Found ' + str(len(models)) + ' models:' + Style.RESET_ALL)
>> "!GEN!" echo             for i, m in enumerate(models, 1): print('  [' + str(i) + '] ' + m)
>> "!GEN!" echo             sel = input('  Select new model (Enter to keep old): ').strip()
>> "!GEN!" echo             if sel.isdigit() and 1 ^<= int(sel) ^<= len(models):
>> "!GEN!" echo                 new_model = models[int(sel)-1]
>> "!GEN!" echo                 d[3] = new_model
>> "!GEN!" echo                 save(data)
>> "!GEN!" echo                 save_cache(d[0], d[1], d[2], new_model)
>> "!GEN!" echo                 print(Fore.GREEN + '  Updated to: ' + new_model + Style.RESET_ALL)
>> "!GEN!" echo         input()
>> "!GEN!" echo while True:
>> "!GEN!" echo     os.system('cls')
>> "!GEN!" echo     data = load()
>> "!GEN!" echo     print('  --- CUSTOM API TOKENS (OpenAI Compatible) ---')
>> "!GEN!" echo     for i, d in enumerate(data, 1): print('  [' + str(i) + '] ' + d[0] + ' (Model: ' + d[3] + ')')
>> "!GEN!" echo     print('  [A] Add New (Deep Scan)  [D] Delete  [S] Re-scan models  [0] Back')
>> "!GEN!" echo     c = input('  Select or Chat [1-10]: ').strip()
>> "!GEN!" echo     if c == '0': break
>> "!GEN!" echo     if c.upper() == 'A': add_new()
>> "!GEN!" echo     elif c.upper() == 'S': rescan()
>> "!GEN!" echo     elif c.upper() == 'D':
>> "!GEN!" echo         idx = input('  Delete #: ').strip()
>> "!GEN!" echo         if idx.isdigit() and 1 ^<= int(idx) ^<= len(data): data.pop(int(idx)-1); save(data)
>> "!GEN!" echo     elif c.isdigit() and 1 ^<= int(c) ^<= len(data):
>> "!GEN!" echo         sel = data[int(c)-1]
>> "!GEN!" echo         client = OpenAI(api_key=sel[2], base_url=sel[1], timeout=20.0)
>> "!GEN!" echo         hist = [{'role':'system','content':'Expert AI. Reply Thai.'}]
>> "!GEN!" echo         os.system('cls')
>> "!GEN!" echo         print('  ' + sel[0] + ' (Model: ' + sel[3] + ')')
>> "!GEN!" echo         while True:
>> "!GEN!" echo             ui = input(Fore.GREEN + '^> You: ' + Style.RESET_ALL).strip()
>> "!GEN!" echo             if not ui: continue
>> "!GEN!" echo             if ui.lower() in ['q','exit','quit']: break
>> "!GEN!" echo             hist.append({'role':'user','content':ui})
>> "!GEN!" echo             try:
>> "!GEN!" echo                 stream = client.chat.completions.create(model=sel[3], messages=hist, max_tokens=4096, stream=True)
>> "!GEN!" echo                 rt = ''
>> "!GEN!" echo                 for ch in stream:
>> "!GEN!" echo                     if ch.choices and ch.choices[0].delta.content: print(ch.choices[0].delta.content, end='', flush=True); rt += ch.choices[0].delta.content
>> "!GEN!" echo                 print(); hist.append({'role':'assistant','content':rt})
>> "!GEN!" echo             except Exception as e: print(Fore.RED + '[ERROR] ' + str(e))
>> "!GEN!" echo '''
>> "!GEN!" echo w('custom_api.py', custom_api)
>> "!GEN!" echo ai_agent = H + '''
>> "!GEN!" echo def ask(pc, model, prompt):
>> "!GEN!" echo     client = Client()
>> "!GEN!" echo     hist=[{'role':'user','content':prompt}]
>> "!GEN!" echo     rt=''
>> "!GEN!" echo     try:
>> "!GEN!" echo         stream=client.chat.completions.create(model=model, provider=pc, messages=hist, temperature=0.2, max_tokens=4096, stream=True)
>> "!GEN!" echo         for ch in stream:
>> "!GEN!" echo             if check_q(): break
>> "!GEN!" echo             if hasattr(ch,'choices') and ch.choices:
>> "!GEN!" echo                 d=ch.choices[0].delta
>> "!GEN!" echo                 if hasattr(d,'content') and d.content and isinstance(d.content,str):
>> "!GEN!" echo                     print(d.content,end='',flush=True)
>> "!GEN!" echo                     rt += d.content
>> "!GEN!" echo         print()
>> "!GEN!" echo     except Exception as e:
>> "!GEN!" echo         print(Fore.RED + '[ERROR] ' + str(e) + Style.RESET_ALL)
>> "!GEN!" echo     return rt
>> "!GEN!" echo def read_text(path):
>> "!GEN!" echo     with open(path,'r',encoding='utf-8',errors='ignore') as f: return f.read()
>> "!GEN!" echo def main():
>> "!GEN!" echo     os.system('cls')
>> "!GEN!" echo     print(Fore.CYAN + '  AI FILE AGENT [RIGHT-HAND MODE]' + Style.RESET_ALL)
>> "!GEN!" echo     workers = load_workers()
>> "!GEN!" echo     if not workers:
>> "!GEN!" echo         print(Fore.RED + '  No working provider in cache. Run Quantum/GPT scan first.' + Style.RESET_ALL)
>> "!GEN!" echo         input()
>> "!GEN!" echo         return
>> "!GEN!" echo     for i,(p,m) in enumerate(workers,1): print('  [' + str(i) + '] ' + p + ' / ' + m)
>> "!GEN!" echo     c = input('  Select AI provider: ').strip()
>> "!GEN!" echo     try: idx=int(c)-1
>> "!GEN!" echo     except Exception: return
>> "!GEN!" echo     if idx ^< 0 or idx ^>= len(workers): return
>> "!GEN!" echo     pname,model=workers[idx]
>> "!GEN!" echo     pc=getattr(g4f.Provider,pname,None)
>> "!GEN!" echo     if pc is None:
>> "!GEN!" echo         print('Provider not found')
>> "!GEN!" echo         input()
>> "!GEN!" echo         return
>> "!GEN!" echo     while True:
>> "!GEN!" echo         os.system('cls')
>> "!GEN!" echo         print(Fore.CYAN + '  AI Agent: ' + pname + ' / ' + model + Style.RESET_ALL)
>> "!GEN!" echo         print('  [1] Analyze file')
>> "!GEN!" echo         print('  [2] Fix/Refactor file (save .ai_fixed)')
>> "!GEN!" echo         print('  [3] Search keyword in folder')
>> "!GEN!" echo         print('  [4] List folder')
>> "!GEN!" echo         print('  [5] Ask about any file/folder')
>> "!GEN!" echo         print('  [0] Back')
>> "!GEN!" echo         ch=input('  Select: ').strip()
>> "!GEN!" echo         if ch=='0': return
>> "!GEN!" echo         if ch=='1':
>> "!GEN!" echo             path=input('  File path: ').strip()
>> "!GEN!" echo             if not os.path.isfile(path):
>> "!GEN!" echo                 print('Not file')
>> "!GEN!" echo                 input()
>> "!GEN!" echo                 continue
>> "!GEN!" echo             text=read_text(path)
>> "!GEN!" echo             if len(text) ^> 60000: text=text[:60000]
>> "!GEN!" echo             prompt='You are ultimate AI auditor. Analyze deeply in Thai: bugs, security, performance, improvements. File: ' + path + chr(10) + text
>> "!GEN!" echo             ask(pc,model,prompt)
>> "!GEN!" echo             input('  Press Enter...')
>> "!GEN!" echo         elif ch=='2':
>> "!GEN!" echo             path=input('  File path: ').strip()
>> "!GEN!" echo             if not os.path.isfile(path):
>> "!GEN!" echo                 print('Not file')
>> "!GEN!" echo                 input()
>> "!GEN!" echo                 continue
>> "!GEN!" echo             text=read_text(path)
>> "!GEN!" echo             if len(text) ^> 60000: text=text[:60000]
>> "!GEN!" echo             prompt='You are ultimate AI engineer. Fix/refactor the following code. Return ONLY complete corrected code. No explanation. File: ' + path + chr(10) + text
>> "!GEN!" echo             print('  Working...')
>> "!GEN!" echo             result=ask(pc,model,prompt)
>> "!GEN!" echo             out=path + '.ai_fixed'
>> "!GEN!" echo             with open(out,'w',encoding='utf-8') as f: f.write(result)
>> "!GEN!" echo             print('  Saved: ' + out)
>> "!GEN!" echo             input('  Press Enter...')
>> "!GEN!" echo         elif ch=='3':
>> "!GEN!" echo             d=input('  Dir: ').strip()
>> "!GEN!" echo             k=input('  Keyword: ').strip()
>> "!GEN!" echo             found=0
>> "!GEN!" echo             for root, dirs, files in os.walk(d):
>> "!GEN!" echo                 for fn in files:
>> "!GEN!" echo                     fp=os.path.join(root, fn)
>> "!GEN!" echo                     try:
>> "!GEN!" echo                         with open(fp,'r',encoding='utf-8',errors='ignore') as f:
>> "!GEN!" echo                             for i, line in enumerate(f,1):
>> "!GEN!" echo                                 if k.lower() in line.lower():
>> "!GEN!" echo                                     print(fp + ':' + str(i) + ': ' + line.strip()[:200])
>> "!GEN!" echo                                     found += 1
>> "!GEN!" echo                                     if found ^> 200: break
>> "!GEN!" echo                     except Exception: pass
>> "!GEN!" echo                     if found ^> 200: break
>> "!GEN!" echo                 if found ^> 200: break
>> "!GEN!" echo             print('  Done. Found: ' + str(found))
>> "!GEN!" echo             input('  Press Enter...')
>> "!GEN!" echo         elif ch=='4':
>> "!GEN!" echo             d=input('  Dir: ').strip()
>> "!GEN!" echo             try:
>> "!GEN!" echo                 names=os.listdir(d)[:200]
>> "!GEN!" echo                 for n in names: print('  ' + n)
>> "!GEN!" echo             except Exception as e: print(str(e))
>> "!GEN!" echo             input('  Press Enter...')
>> "!GEN!" echo         elif ch=='5':
>> "!GEN!" echo             path=input('  File or Dir path: ').strip()
>> "!GEN!" echo             info=''
>> "!GEN!" echo             if os.path.isfile(path): info=read_text(path)[:30000]
>> "!GEN!" echo             elif os.path.isdir(path): info=chr(10).join(os.listdir(path)[:200])
>> "!GEN!" echo             else:
>> "!GEN!" echo                 print('Not found')
>> "!GEN!" echo                 input()
>> "!GEN!" echo                 continue
>> "!GEN!" echo             q=input('  Question: ').strip()
>> "!GEN!" echo             prompt='You are ultimate AI assistant. Answer Thai. Path: ' + path + chr(10) + 'Question: ' + q + chr(10) + 'Data:' + chr(10) + info
>> "!GEN!" echo             ask(pc,model,prompt)
>> "!GEN!" echo             input('  Press Enter...')
>> "!GEN!" echo if __name__ == '__main__': main()
>> "!GEN!" echo '''
>> "!GEN!" echo w('ai_agent.py', ai_agent)
>> "!GEN!" echo repo_analyzer = H + '''
>> "!GEN!" echo IGNORE_DIRS = {'.git', 'node_modules', '__pycache__', '.venv', 'venv', '.idea', '.vscode', 'build', 'dist', '.next', '.cache', '.tox', 'env', '.pytest_cache'}
>> "!GEN!" echo IGNORE_EXTS = {'.png', '.jpg', '.jpeg', '.gif', '.bmp', '.ico', '.svg', '.mp4', '.mp3', '.wav', '.zip', '.tar', '.gz', '.exe', '.dll', '.so', '.dylib', '.pdf', '.doc', '.docx', '.xls', '.xlsx', '.pyc', '.pyo', '.lock', '.map', '.woff', '.woff2', '.ttf', '.eot'}
>> "!GEN!" echo def pack_repo(root_dir):
>> "!GEN!" echo     lt = chr(60)
>> "!GEN!" echo     gt = chr(62)
>> "!GEN!" echo     tree = []
>> "!GEN!" echo     files_content = []
>> "!GEN!" echo     for root, dirs, files in os.walk(root_dir):
>> "!GEN!" echo         dirs[:] = [d for d in dirs if d not in IGNORE_DIRS]
>> "!GEN!" echo         rel_root = os.path.relpath(root, root_dir)
>> "!GEN!" echo         if rel_root == '.': rel_root = ''
>> "!GEN!" echo         for f in files:
>> "!GEN!" echo             ext = os.path.splitext(f)[1].lower()
>> "!GEN!" echo             if ext in IGNORE_EXTS: continue
>> "!GEN!" echo             rel_path = os.path.join(rel_root, f) if rel_root else f
>> "!GEN!" echo             tree.append(rel_path)
>> "!GEN!" echo             full_path = os.path.join(root, f)
>> "!GEN!" echo             try:
>> "!GEN!" echo                 with open(full_path, 'r', encoding='utf-8', errors='ignore') as file:
>> "!GEN!" echo                     content = file.read()
>> "!GEN!" echo                 lines = content.splitlines()
>> "!GEN!" echo                 compressed = []
>> "!GEN!" echo                 prev_empty = False
>> "!GEN!" echo                 for line in lines:
>> "!GEN!" echo                     stripped = line.rstrip()
>> "!GEN!" echo                     if stripped == '':
>> "!GEN!" echo                         if not prev_empty: compressed.append('')
>> "!GEN!" echo                         prev_empty = True
>> "!GEN!" echo                     else:
>> "!GEN!" echo                         compressed.append(stripped)
>> "!GEN!" echo                         prev_empty = False
>> "!GEN!" echo                 files_content.append((rel_path, chr(10).join(compressed)))
>> "!GEN!" echo             except Exception: pass
>> "!GEN!" echo     xml_out = [lt + 'repository_structure' + gt]
>> "!GEN!" echo     for t in tree: xml_out.append('  ' + lt + 'file' + gt + t + lt + '/file' + gt)
>> "!GEN!" echo     xml_out.append(lt + '/repository_structure' + gt + chr(10) + chr(10) + lt + 'repository_contents' + gt)
>> "!GEN!" echo     for path, content in files_content:
>> "!GEN!" echo         xml_out.append(lt + 'file path="' + path + '"' + gt + chr(10) + content + chr(10) + lt + '/file' + gt)
>> "!GEN!" echo     xml_out.append(lt + '/repository_contents' + gt)
>> "!GEN!" echo     return chr(10).join(xml_out)
>> "!GEN!" echo def main():
>> "!GEN!" echo     os.system('cls')
>> "!GEN!" echo     print(Fore.CYAN + '  AI REPO AGENT [REPOMIX-STYLE DEEP PACK]' + Style.RESET_ALL)
>> "!GEN!" echo     workers = load_workers()
>> "!GEN!" echo     if not workers:
>> "!GEN!" echo         print(Fore.RED + '  No working provider in cache. Run Quantum/GPT scan first.' + Style.RESET_ALL)
>> "!GEN!" echo         input()
>> "!GEN!" echo         return
>> "!GEN!" echo     for i,(p,m) in enumerate(workers,1): print('  [' + str(i) + '] ' + p + ' / ' + m)
>> "!GEN!" echo     c = input('  Select AI provider: ').strip()
>> "!GEN!" echo     try: idx=int(c)-1
>> "!GEN!" echo     except Exception: return
>> "!GEN!" echo     if idx ^< 0 or idx ^>= len(workers): return
>> "!GEN!" echo     pname,model=workers[idx]
>> "!GEN!" echo     pc=getattr(g4f.Provider,pname,None)
>> "!GEN!" echo     if pc is None: print('Provider not found'); input(); return
>> "!GEN!" echo     root_dir = input('  Enter folder path: ').strip().strip('"')
>> "!GEN!" echo     if not os.path.isdir(root_dir): print('Not a directory'); input(); return
>> "!GEN!" echo     print('  Packing repository... (Compressing whitespaces)')
>> "!GEN!" echo     packed = pack_repo(root_dir)
>> "!GEN!" echo     print('  Packed size: ' + str(len(packed)) + ' chars')
>> "!GEN!" echo     print('  [1] Deep Audit (Bugs, Security, Architecture)')
>> "!GEN!" echo     print('  [2] Auto-Fix ^& Refactor (Save to _ai_fixed folder)')
>> "!GEN!" echo     print('  [0] Back')
>> "!GEN!" echo     ch = input('  Select: ').strip()
>> "!GEN!" echo     if ch == '0': return
>> "!GEN!" echo     if ch == '1':
>> "!GEN!" echo         prompt = 'You are an Expert AI Architect and Security Auditor. Analyze the following repository deeply. Reply in Thai. 1. Identify critical bugs, security vulnerabilities, and performance bottlenecks. 2. Suggest architectural improvements. 3. Be specific and reference file paths.' + chr(10) + chr(10) + packed
>> "!GEN!" echo     elif ch == '2':
>> "!GEN!" echo         lt = chr(60)
>> "!GEN!" echo         gt = chr(62)
>> "!GEN!" echo         prompt = 'You are an Expert AI Code Refactorer. Fix all bugs, security flaws, and refactor the code for maximum performance. Return ONLY the modified files in XML format like this: ' + lt + 'fixed_files' + gt + lt + 'file path="relative/path.py"' + gt + '...complete corrected code...' + lt + '/file' + gt + lt + '/fixed_files' + gt + '. Do not include explanations outside the XML.' + chr(10) + chr(10) + packed
>> "!GEN!" echo     else: return
>> "!GEN!" echo     print(chr(10) + '  Sending to AI... (This may take a while for large repos)' + chr(10))
>> "!GEN!" echo     client = Client(proxy=PROXY)
>> "!GEN!" echo     hist = [{'role':'user','content':prompt}]
>> "!GEN!" echo     rt = ''
>> "!GEN!" echo     try:
>> "!GEN!" echo         stream = client.chat.completions.create(model=model, provider=pc, messages=hist, temperature=0.2, max_tokens=8192, stream=True)
>> "!GEN!" echo         for ch_s in stream:
>> "!GEN!" echo             if check_q(): break
>> "!GEN!" echo             if hasattr(ch_s,'choices') and ch_s.choices:
>> "!GEN!" echo                 d=ch_s.choices[0].delta
>> "!GEN!" echo                 if hasattr(d,'content') and d.content and isinstance(d.content,str):
>> "!GEN!" echo                     print(d.content,end='',flush=True)
>> "!GEN!" echo                     rt += d.content
>> "!GEN!" echo         print()
>> "!GEN!" echo     except Exception as e: print(Fore.RED + '[ERROR] ' + str(e) + Style.RESET_ALL); input(); return
>> "!GEN!" echo     if ch == '2' and rt:
>> "!GEN!" echo         lt = chr(60)
>> "!GEN!" echo         gt = chr(62)
>> "!GEN!" echo         pattern = lt + 'file path="([^"]+)"' + gt + r'\s*(.*?)\s*' + lt + '/file' + gt
>> "!GEN!" echo         matches = re.findall(pattern, rt, re.DOTALL)
>> "!GEN!" echo         if not matches:
>> "!GEN!" echo             xml_block = re.search(r'```(?:xml)?\s*(' + lt + 'fixed_files' + gt + '.*?' + lt + '/fixed_files' + gt + chr(124) + lt + 'file.*?' + lt + '/file' + gt + r')\s*```', rt, re.DOTALL)
>> "!GEN!" echo             if xml_block: matches = re.findall(pattern, xml_block.group(1), re.DOTALL)
>> "!GEN!" echo         if matches:
>> "!GEN!" echo             out_dir = root_dir.rstrip('\\/') + '_ai_fixed'
>> "!GEN!" echo             os.makedirs(out_dir, exist_ok=True)
>> "!GEN!" echo             for path, content in matches:
>> "!GEN!" echo                 full_out = os.path.join(out_dir, path)
>> "!GEN!" echo                 os.makedirs(os.path.dirname(full_out), exist_ok=True)
>> "!GEN!" echo                 with open(full_out, 'w', encoding='utf-8') as f: f.write(content)
>> "!GEN!" echo                 print(Fore.GREEN + '  Saved: ' + full_out + Style.RESET_ALL)
>> "!GEN!" echo         else: print(Fore.YELLOW + '  Could not parse fixed files from AI response.' + Style.RESET_ALL)
>> "!GEN!" echo     input(chr(10) + '  Press Enter...')
>> "!GEN!" echo if __name__ == '__main__': main()
>> "!GEN!" echo '''
>> "!GEN!" echo w('repo_analyzer.py', repo_analyzer)
>> "!GEN!" echo print()
>> "!GEN!" echo print('  All Python files generated successfully')

echo   Running generator...
"!PYTHON_EXE!" "!GEN!"
del "!GEN!" >nul 2>&1

echo(
echo  ======================================================================
echo                     SETUP COMPLETE
echo  ======================================================================
echo(
echo   Ready to use. Select any menu option 2-6 to start.
echo(
pause
goto MENU

:: ======================================================================
:: QUANTUM SCAN
:: ======================================================================
:QUANTUM_SCAN
cls
if not exist "!PYTHON_EXE!" ( echo   [ERROR] Setup first. & pause & goto MENU )
if not exist "!SCRIPTS_DIR!\quantum_scan.py" ( echo   [ERROR] quantum_scan.py not found. Run Setup. & pause & goto MENU )
"!PYTHON_EXE!" "!SCRIPTS_DIR!\quantum_scan.py"
pause
goto MENU

:: ======================================================================
:: CLAUDE HUNT
:: ======================================================================
:CLAUDE_HUNT
cls
if not exist "!PYTHON_EXE!" ( echo   [ERROR] Setup first. & pause & goto MENU )
if not exist "!SCRIPTS_DIR!\claude_hunt.py" ( echo   [ERROR] claude_hunt.py not found. Run Setup. & pause & goto MENU )
"!PYTHON_EXE!" "!SCRIPTS_DIR!\claude_hunt.py"
pause
goto MENU

:: ======================================================================
:: GPT-5 HUNT
:: ======================================================================
:GPT5_HUNT
cls
if not exist "!PYTHON_EXE!" ( echo   [ERROR] Setup first. & pause & goto MENU )
if not exist "!SCRIPTS_DIR!\gpt5_scan.py" ( echo   [ERROR] gpt5_scan.py not found. Run Setup. & pause & goto MENU )
"!PYTHON_EXE!" "!SCRIPTS_DIR!\gpt5_scan.py"
pause
goto MENU

:: ======================================================================
:: TGPT MODE
:: ======================================================================
:TGPT_MODE
cls
if not exist "!TGPT_EXE!" ( echo   [ERROR] TGPT not found. Run Setup first. & pause & goto MENU )
echo(
echo  ======================================================================
echo   TGPT MODE - Select Provider (EXPANDED - Unlimited)
echo  ======================================================================
echo(
echo   [1] Phind           [14] OpenAI
echo   [2] Blackbox        [15] Gemini
echo   [3] DeepSeek        [16] Claude
echo   [4] AI Horde        [17] Groq
echo   [5] DuckDuckGo      [18] Mistral
echo   [6] Brave           [19] Ollama
echo   [7] KoboldAI        [20] Llama
echo   [8] Isou            [21] Perplexity
echo   [9] PowerBrain      [22] Replicate
echo   [10] HuggingFace    [23] Together
echo   [11] XAI            [24] Custom...
echo   [12] OpenRouter
echo   [13] LocalAI
echo(
echo   [0] Back
echo  ======================================================================
echo(
set /p tgpt_choice="  Select [0-24]: "

if "%tgpt_choice%"=="0" goto MENU
set "TGPT_PROVIDER="
if "%tgpt_choice%"=="1" set "TGPT_PROVIDER=phind"
if "%tgpt_choice%"=="2" set "TGPT_PROVIDER=blackbox"
if "%tgpt_choice%"=="3" set "TGPT_PROVIDER=deepseek"
if "%tgpt_choice%"=="4" set "TGPT_PROVIDER=aihorde"
if "%tgpt_choice%"=="5" set "TGPT_PROVIDER=duckduckgo"
if "%tgpt_choice%"=="6" set "TGPT_PROVIDER=brave"
if "%tgpt_choice%"=="7" set "TGPT_PROVIDER=koboldai"
if "%tgpt_choice%"=="8" set "TGPT_PROVIDER=isou"
if "%tgpt_choice%"=="9" set "TGPT_PROVIDER=powerbrain"
if "%tgpt_choice%"=="10" set "TGPT_PROVIDER=huggingface"
if "%tgpt_choice%"=="11" set "TGPT_PROVIDER=xai"
if "%tgpt_choice%"=="12" set "TGPT_PROVIDER=openrouter"
if "%tgpt_choice%"=="13" set "TGPT_PROVIDER=localai"
if "%tgpt_choice%"=="14" set "TGPT_PROVIDER=openai"
if "%tgpt_choice%"=="15" set "TGPT_PROVIDER=gemini"
if "%tgpt_choice%"=="16" set "TGPT_PROVIDER=claude"
if "%tgpt_choice%"=="17" set "TGPT_PROVIDER=groq"
if "%tgpt_choice%"=="18" set "TGPT_PROVIDER=mistral"
if "%tgpt_choice%"=="19" set "TGPT_PROVIDER=ollama"
if "%tgpt_choice%"=="20" set "TGPT_PROVIDER=llama"
if "%tgpt_choice%"=="21" set "TGPT_PROVIDER=perplexity"
if "%tgpt_choice%"=="22" set "TGPT_PROVIDER=replicate"
if "%tgpt_choice%"=="23" set "TGPT_PROVIDER=together"
if "%tgpt_choice%"=="24" (
    set /p TGPT_PROVIDER="  Enter custom provider name: "
)
if not defined TGPT_PROVIDER goto TGPT_MODE

cls
echo(
echo  ======================================================================
echo   TGPT - !TGPT_PROVIDER!
echo   exit=menu  q=quit
echo  ======================================================================
echo(

:TGPT_CHAT_LOOP
set /p "q=  > You: "
if /i "!q!"=="exit" goto MENU
if /i "!q!"=="q" goto MENU
if "!q!"=="" goto TGPT_CHAT_LOOP
echo(
set "HTTP_PROXY=http://127.0.0.1:40000"
set "HTTPS_PROXY=http://127.0.0.1:40000"
"!TGPT_EXE!" --provider !TGPT_PROVIDER! "!q!"
echo(
goto TGPT_CHAT_LOOP

:: ======================================================================
:: NVIDIA SCAN
:: ======================================================================
:NVIDIA_SCAN
cls
if not exist "!PYTHON_EXE!" ( echo   [ERROR] Setup first. & pause & goto MENU )
if not exist "!SCRIPTS_DIR!\nvidia_scan.py" ( echo   [ERROR] nvidia_scan.py not found. Run Setup. & pause & goto MENU )
"!PYTHON_EXE!" "!SCRIPTS_DIR!\nvidia_scan.py"
pause
goto MENU

:: ======================================================================
:: SECRET TOOLS
:: ======================================================================
:SECRET_TOOLS
cls
echo(
echo  ======================================================================
echo   SECRET TOOLS - Deep Penetration
echo  ======================================================================
echo(
echo   [1] DeepSeek Coder
echo   [2] CodeLlama
echo   [3] WizardCoder
echo   [4] Qwen Coder
echo   [5] Phind CodeLlama
echo   [6] Codestral (Mistral)
echo   [0] Back
echo(
echo  ======================================================================
echo(
set /p tool_choice="  Select [0-6]: "

if "%tool_choice%"=="0" goto MENU

if not exist "!PYTHON_EXE!" ( echo   [ERROR] Setup first. & pause & goto SECRET_TOOLS )
if not exist "!SCRIPTS_DIR!\secret_tools.py" ( echo   [ERROR] secret_tools.py not found. Run Setup. & pause & goto SECRET_TOOLS )
"!PYTHON_EXE!" "!SCRIPTS_DIR!\secret_tools.py" %tool_choice%
pause
goto SECRET_TOOLS

:: ======================================================================
:: FILE ANALYZER
:: ======================================================================
:FILE_ANALYZER
cls
if not exist "!PYTHON_EXE!" ( echo   [ERROR] Setup first. & pause & goto MENU )
if not exist "!SCRIPTS_DIR!\file_analyzer.py" ( echo   [ERROR] file_analyzer.py not found. Run Setup. & pause & goto MENU )
"!PYTHON_EXE!" "!SCRIPTS_DIR!\file_analyzer.py"
pause
goto MENU

:: ======================================================================
:: USE CACHE & CHAT
:: ======================================================================
:USE_CACHE
cls
echo(
echo  ======================================================================
echo   USE CACHE ^& CHAT (NO RE-SCAN)
echo  ======================================================================
echo(
echo   [1] Quantum Cache
echo   [2] Claude Cache
echo   [3] Nvidia Cache
echo   [4] Secret Cache
echo   [5] GPT-5 / Next-Gen Cache
echo   [6] Custom API Cache
echo   [0] Back
echo(
set /p cache_choice="  Select [0-6]: "
if "%cache_choice%"=="0" goto MENU
if "%cache_choice%"=="1" set "CACHE_MODE=1"
if "%cache_choice%"=="2" set "CACHE_MODE=2"
if "%cache_choice%"=="3" set "CACHE_MODE=3"
if "%cache_choice%"=="4" set "CACHE_MODE=4"
if "%cache_choice%"=="5" set "CACHE_MODE=5"
if "%cache_choice%"=="6" set "CACHE_MODE=6"
if not defined CACHE_MODE goto USE_CACHE

if not exist "!PYTHON_EXE!" ( echo   [ERROR] Setup first. & pause & goto MENU )
if not exist "!SCRIPTS_DIR!\cache_chat.py" ( echo   [ERROR] cache_chat.py not found. Run Setup. & pause & goto MENU )
"!PYTHON_EXE!" "!SCRIPTS_DIR!\cache_chat.py" !CACHE_MODE!
pause
goto MENU

:: ======================================================================
:: CUSTOM API TOKENS
:: ======================================================================
:CUSTOM_API
cls
if not exist "!PYTHON_EXE!" ( echo   [ERROR] Setup first. & pause & goto MENU )
if not exist "!SCRIPTS_DIR!\custom_api.py" ( echo   [ERROR] custom_api.py not found. Run Setup. & pause & goto MENU )
"!PYTHON_EXE!" "!SCRIPTS_DIR!\custom_api.py"
pause
goto MENU

:: ======================================================================
:: AI FILE AGENT
:: ======================================================================
:AI_AGENT
cls
if not exist "!PYTHON_EXE!" (
echo   [ERROR] Setup first.
pause
goto MENU
)
if not exist "!SCRIPTS_DIR!\ai_agent.py" (
echo   [ERROR] ai_agent.py not found. Run Setup.
pause
goto MENU
)
"!PYTHON_EXE!" "!SCRIPTS_DIR!\ai_agent.py"
pause
goto MENU

:: ======================================================================
:: REPO ANALYZER
:: ======================================================================
:REPO_ANALYZER
cls
if not exist "!PYTHON_EXE!" ( echo   [ERROR] Setup first. & pause & goto MENU )
if not exist "!SCRIPTS_DIR!\repo_analyzer.py" ( echo   [ERROR] repo_analyzer.py not found. Run Setup. & pause & goto MENU )
"!PYTHON_EXE!" "!SCRIPTS_DIR!\repo_analyzer.py"
pause
goto MENU

:: ======================================================================
:: EDIT API KEYS
:: ======================================================================
:EDIT_KEYS
cls
echo(
echo  ======================================================================
echo                      EDIT NVIDIA API KEY
echo  ======================================================================
echo(
if exist "!CONFIG_FILE!" type "!CONFIG_FILE!"
echo(
set "new_key="
set /p new_key="  Enter Nvidia API Key (Enter to cancel): "
if "!new_key!"=="" goto MENU
powershell -Command "(Get-Content '!CONFIG_FILE!') -replace 'API_KEY=.*', 'API_KEY=!new_key!' | Set-Content '!CONFIG_FILE!'"
echo   [OK] Saved.
pause
goto MENU

:: ======================================================================
:: CLEANUP
:: ======================================================================
:CLEANUP
cls
echo(
echo  ======================================================================
echo                     CLEANUP (DELETE GHOSTBOX)
echo                     BASE: !BASE_DIR!
echo  ======================================================================
echo(
set /p "confirm=  Delete all? (yes/no): "
if /i not "!confirm!"=="yes" goto MENU
if exist "!BASE_DIR!" rmdir /s /q "!BASE_DIR!" >nul 2>&1
echo   [DONE]
pause
goto MENU

:: ======================================================================
:: VIEW LOG
:: ======================================================================
:VIEW_LOG
cls
if exist "!SCRIPTS_DIR!\error_log.txt" (
    powershell -Command "Get-Content '!SCRIPTS_DIR!\error_log.txt' -Tail 50"
) else (
    echo   No error log found.
)
pause
goto MENU

:: ======================================================================
:: EXIT
:: ======================================================================
:EXIT
echo(
echo   Goodbye
timeout /t 2 >nul
endlocal
exit /b 0
