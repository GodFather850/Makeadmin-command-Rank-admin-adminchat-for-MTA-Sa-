# Makeadmin-command-Rank-admin-adminchat-for-MTA-Sa-
This file contains all the required admin ranks within the MTA server and only a few places in the script need to be changed to match your server.

![MTA:sa](/home/godfather/Downloads/jpg2png/mta131.png)
---
# MTA Admin Chat System + MakeAdmin Command 🚀

**Scripted by GodFather** – A professional admin chat and rank management system for MTA:SA servers.

### Features 🔧 

- **/a <message>** – Admin chat visible only to staff (rank 1+)
  - Custom rank titles and colors (30 ranks from Trial to Scripter)
  - Beautiful hex color formatting
  - Message length limit and input validation

- **/makeadmin <player> <rank>** – Promote players to admin
  - Only accessible to rank 28+ (Owner/Scripter level)
  - Sets admin rank via Accounts-System export
  - Server-wide announcement with rank name

- Fully integrated with **Accounts-System** resource
- Secure checks (logged in, admin level, input validation)
- Clean and optimized code

### Rank List (30 Levels) 📂
1. Hoster  
2. VIP  
3. Maper  
...  
30. Scripter (highest)

### Requirements
- MTA:SA Server
- `Accounts-System` resource (for account data)

### Installation ▶️
1. Place this file in your server resources
2. Add to `mtaserver.conf`:
3. Change the name of the system admin and database tables in the code if they are different.

```lua
-- Replace your system account name.
local accSYs = exports["Accounts-System"]

-- and table names
if tonumber(getElementData(accSYs:getPlayerAcc(thePlayer), "pAdmin")) <= 27 then -- "pAdmin" is table name
    return false
end

```

--- 
# -👤Created By GodFather 

# -📜MTA Scripter • Linux Learner🐧 • Linux User🔥 • Future DevOps Engineer 🇺🇸🔥
