# Discord Announcement GUI (Small UI) — Roblox Studio (Safe)

A small, polished announcement GUI for Roblox Studio that shows a compact floating banner with a styled **"Click Here"** button which (if allowed by the client) opens a Discord invite in the player's browser.

**Important:** This is intended to be used in games you own via Roblox Studio. Do **not** use with executors or to inject into other people's games.

## Files
- `StarterPlayerScripts/AnnouncementLocalScript.lua` — LocalScript to place in `StarterPlayer -> StarterPlayerScripts` or `StarterGui`.

## How to use
1. Clone or copy this repo.
2. Open Roblox Studio for the game you own.
3. In Explorer: `StarterPlayer` → `StarterPlayerScripts` (or `StarterGui`) → Insert a **LocalScript**.
4. Replace LocalScript contents with `AnnouncementLocalScript.lua`.
5. Play the game to test. The UI appears small and draggable. Clicking **Click Here** attempts to open the Discord invite; if blocked, it shows a notification with the link.

## Edit the invite
Change the `DISCORD_INVITE` value near the top of the script to your invite link.

## License
Use freely for your own projects.
