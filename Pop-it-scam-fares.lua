local a=game:GetService"Players"
local b=game:GetService"RunService"
local c=game:GetService"ReplicatedStorage"
local d=game:GetService"UserInputService"
local e=a.LocalPlayer


local f={4430015943,2524206516,7969496808}
local g=false
for h,i in ipairs(f)do
if e.UserId==i then
g=true
break
end
end

if not g then
warn"You are not whitelisted to use this script."
return
end


local h=false
local i
local j
local k=false
local l=false


local m=false
local n


local o="Sparkly Boo"


local p




local q=Instance.new"ScreenGui"
q.Name="PlayerCheckGui"
q.Parent=e:WaitForChild"PlayerGui"
q.ResetOnSpawn=false


local r=Instance.new"Frame"
r.Name="MainFrame"
r.Size=UDim2.new(0,320,0,520)
r.Position=UDim2.new(0.5,-160,0.5,-260)
r.BackgroundColor3=Color3.fromRGB(28,28,30)
r.BorderSizePixel=0
r.AnchorPoint=Vector2.new(0,0)
r.Parent=q
r.Active=true
r.Draggable=false

local s=Instance.new"Frame"
s.Size=UDim2.new(1,12,1,12)
s.Position=UDim2.new(0,-6,0,-6)
s.BackgroundColor3=Color3.new(0,0,0)
s.BackgroundTransparency=0.7
s.BorderSizePixel=0
s.ZIndex=0
s.Parent=r

local t=Instance.new"TextLabel"
t.Size=UDim2.new(1,0,0,50)
t.BackgroundTransparency=1
t.Position=UDim2.new(0,0,0,0)
t.Text="Main"
t.TextColor3=Color3.fromRGB(255,255,255)
t.Font=Enum.Font.GothamBold
t.TextSize=28
t.TextStrokeTransparency=0.75
t.TextYAlignment=Enum.TextYAlignment.Center
t.Parent=r

local u=Instance.new"TextButton"
u.Size=UDim2.new(0,50,0,30)
u.Position=UDim2.new(1,-60,0,10)
u.BackgroundColor3=Color3.fromRGB(255,75,75)
u.Text="X"
u.TextColor3=Color3.fromRGB(255,255,255)
u.Font=Enum.Font.GothamBold
u.TextSize=22
u.AutoButtonColor=false
u.BorderSizePixel=0
u.Parent=r
u.TextScaled=true
u.MouseEnter:Connect(function()
u.BackgroundColor3=Color3.fromRGB(255,45,45)
end)
u.MouseLeave:Connect(function()
u.BackgroundColor3=Color3.fromRGB(255,75,75)
end)
u.MouseButton1Click:Connect(function()
q:Destroy()
end)


local v=Instance.new"TextBox"
v.Size=UDim2.new(0,280,0,45)
v.Position=UDim2.new(0,20,0,70)
v.PlaceholderText="Enter player name"
v.ClearTextOnFocus=false
v.Text=""
v.BackgroundColor3=Color3.fromRGB(38,38,40)
v.TextColor3=Color3.fromRGB(220,220,220)
v.Font=Enum.Font.GothamSemibold
v.TextSize=19
v.TextEditable=true
v.TextXAlignment=Enum.TextXAlignment.Left
v.ClipsDescendants=true
v.BorderSizePixel=0
v.PlaceholderColor3=Color3.fromRGB(160,160,160)
v.TextWrapped=false
v.Parent=r


local w=Instance.new"TextBox"
w.Size=UDim2.new(0,280,0,45)
w.Position=UDim2.new(0,20,0,125)
w.PlaceholderText="Enter equip item name"
w.ClearTextOnFocus=false
w.Text=""
w.BackgroundColor3=Color3.fromRGB(38,38,40)
w.TextColor3=Color3.fromRGB(220,220,220)
w.Font=Enum.Font.GothamSemibold
w.TextSize=19
w.TextEditable=true
w.TextXAlignment=Enum.TextXAlignment.Left
w.ClipsDescendants=true
w.BorderSizePixel=0
w.PlaceholderColor3=Color3.fromRGB(160,160,160)
w.TextWrapped=false
w.Parent=r


local x=Instance.new"TextButton"
x.Size=UDim2.new(0,280,0,45)
x.Position=UDim2.new(0,20,0,180)
x.BackgroundColor3=Color3.fromRGB(85,170,255)
x.BorderSizePixel=0
x.AutoButtonColor=false
x.Font=Enum.Font.GothamBold
x.Text="Activate"
x.TextColor3=Color3.fromRGB(255,255,255)
x.TextSize=22
x.Parent=r
x.MouseEnter:Connect(function()
x.BackgroundColor3=Color3.fromRGB(60,140,230)
end)
x.MouseLeave:Connect(function()
x.BackgroundColor3=Color3.fromRGB(85,170,255)
end)

local y=Instance.new"TextButton"
y.Size=UDim2.new(0,130,0,40)
y.Position=UDim2.new(0,20,0,235)
y.BackgroundColor3=Color3.fromRGB(200,40,40)
y.BorderSizePixel=0
y.AutoButtonColor=false
y.Font=Enum.Font.GothamBold
y.Text="XRay: OFF"
y.TextColor3=Color3.fromRGB(255,255,255)
y.TextSize=20
y.Parent=r

local z=Instance.new"TextButton"
z.Size=UDim2.new(0,130,0,40)
z.Position=UDim2.new(0,170,0,235)
z.BackgroundColor3=Color3.fromRGB(200,40,40)
z.BorderSizePixel=0
z.AutoButtonColor=false
z.Font=Enum.Font.GothamBold
z.Text="No Sit: OFF"
z.TextColor3=Color3.fromRGB(255,255,255)
z.TextSize=20
z.Parent=r


local A=Instance.new"TextButton"
A.Size=UDim2.new(0,280,0,45)
A.Position=UDim2.new(0,20,0,290)
A.BackgroundColor3=Color3.fromRGB(200,40,40)
A.BorderSizePixel=0
A.AutoButtonColor=false
A.Font=Enum.Font.GothamBold
A.Text="Follow: OFF"
A.TextColor3=Color3.fromRGB(255,255,255)
A.TextSize=22
A.Parent=r
A.MouseButton1Click:Connect(function()
setFollow(not l)
end)


local B=Instance.new"TextButton"
B.Size=UDim2.new(0,280,0,45)
B.Position=UDim2.new(0,20,0,345)
B.BackgroundColor3=Color3.fromRGB(200,40,40)
B.BorderSizePixel=0
B.AutoButtonColor=false
B.Font=Enum.Font.GothamBold
B.Text="Always Follow: OFF"
B.TextColor3=Color3.fromRGB(255,255,255)
B.TextSize=22
B.Parent=r
B.MouseButton1Click:Connect(function()
setAlwaysFollow(not m)
end)

local C=Instance.new"TextLabel"
C.Size=UDim2.new(0,280,0,40)
C.Position=UDim2.new(0,20,0,400)
C.BackgroundTransparency=1
C.Text=""
C.TextColor3=Color3.fromRGB(255,255,255)
C.Font=Enum.Font.GothamBold
C.TextSize=20
C.TextWrapped=true
C.TextYAlignment=Enum.TextYAlignment.Center
C.TextXAlignment=Enum.TextXAlignment.Center
C.Parent=r

local D=Instance.new"TextButton"
D.Size=UDim2.new(0,280,0,45)
D.Position=UDim2.new(0,20,0,455)
D.BackgroundColor3=Color3.fromRGB(85,170,255)
D.BorderSizePixel=0
D.AutoButtonColor=false
D.Font=Enum.Font.GothamBold
D.Text="Reset"
D.TextColor3=Color3.fromRGB(255,255,255)
D.TextSize=22
D.Parent=r
D.MouseEnter:Connect(function()
D.BackgroundColor3=Color3.fromRGB(60,140,230)
end)
D.MouseLeave:Connect(function()
D.BackgroundColor3=Color3.fromRGB(85,170,255)
end)
D.MouseButton1Click:Connect(function()
h=false
C.Text="Reset: wardrobe will run next activation."
end)




local E=false
local F,G,H

r.InputBegan:Connect(function(I)
if I.UserInputType==Enum.UserInputType.MouseButton1 then
E=true
G=I.Position
H=r.Position
end
end)

r.InputChanged:Connect(function(I)
if I.UserInputType==Enum.UserInputType.MouseMovement or I.UserInputType==Enum.UserInputType.Touch then
F=I
end
end)

d.InputChanged:Connect(function(I)
if E and I==F then
local J=I.Position-G
r.Position=UDim2.new(H.X.Scale,H.X.Offset+J.X,H.Y.Scale,H.Y.Offset+J.Y)
end
end)

r.InputEnded:Connect(function(I)
if I.UserInputType==Enum.UserInputType.MouseButton1 then
E=false
F=nil
end
end)






local function cleanupVIPField()
local I=workspace:FindFirstChild"Map"
if I then
local J=I:FindFirstChild"VIP"
if J then
local K=J:FindFirstChild"Field"
if K then
K:Destroy()
end
end
end
end


local function executeWardrobeSequence()
local I=c.RemoteEvents:WaitForChild"Equip"
local J=c.RemoteEvents:WaitForChild"Drop"


I:FireServer"Wardrobe"
task.wait(1)
J:FireServer"Wardrobe"
task.wait(1)


local K
for L=1,10 do
K=workspace:FindFirstChild"Dropped"
if K then break end
task.wait(0.5)
end
if not K then
warn"Dropped folder not found!"
return
end


local L=K:FindFirstChild"Wardrobe"or K:FindFirstChild"Wardrope"
if not L then
warn"Dropped wardrobe object not found!"
return
end
local M=L:FindFirstChild"Handle"or L:FindFirstChildWhichIsA"BasePart"
if not M then
warn"Wardrobe handle not found!"
return
end

local N=e.Character or e.CharacterAdded:Wait()
local O=N:WaitForChild"HumanoidRootPart"
O.CFrame=M.CFrame*CFrame.new(0,0,-2)
task.wait(0.3)
local P=false
for Q,R in ipairs(M:GetDescendants())do
if R:IsA"ProximityPrompt"and R.ActionText:lower():find"hide"then
fireproximityprompt(R)
P=true
break
end
end
if not P then
warn"No prompt found on wardrobe handle!"
end
task.wait(1)


local Q=O.CFrame
local R=CFrame.new(133.00206,17.5000038,224.951294,-1,0,0,0,1,0,0,0,-1)
local S=3
local T=tick()
while tick()-T<S do
O.CFrame=R
task.wait(0.2)
local U=N:WaitForChild"Humanoid"
U.Jump=true
task.wait(0.2)
end
O.CFrame=Q
end


local function monitorTargetForSauce(I)
local J=c.RemoteEvents:WaitForChild"Equip"
local K=c.RemoteEvents:WaitForChild"Drop"

while I and I.Parent and I.Character and I.Character.Parent do
task.wait(0.5)
local L=false
if I.Character then
local M=I.Character:FindFirstChild"Invisible Pink Sauce"
if M and M:IsA"Tool"then
L=true
end
end

if L and not k then
J:FireServer(o)
local M=e.Character or e.CharacterAdded:Wait()
local N=M:WaitForChild"HumanoidRootPart"
if I.Character and I.Character:FindFirstChild"HumanoidRootPart"then
N.CFrame=I.Character.HumanoidRootPart.CFrame
end
k=true
elseif not L and k then
K:FireServer(o)
local M=e.Character or e.CharacterAdded:Wait()
local N=M:WaitForChild"HumanoidRootPart"
if i then
N.CFrame=i
end
k=false
end
end
end


local function checkPlayerAndRun()
local I=v.Text:lower():gsub("%s+","")
if I==""then
C.TextColor3=Color3.new(1,0.5,0.5)
C.Text="Please enter a player name."
return
end


local J=w.Text
if J and J~=""then
local K=e:FindFirstChild"Items"
if K and K:FindFirstChild(J)then
o=J
C.Text=J.." found in your inventory ✅"
C.TextColor3=Color3.fromRGB(100,255,100)
else
o="Sparkly Boo"
C.Text=J.." not found in your inventory ❌ Using Sparkly Boo."
C.TextColor3=Color3.fromRGB(255,100,100)
end
else
o="Sparkly Boo"
C.Text="Player found. Monitoring for Pink Sauce..."
C.TextColor3=Color3.fromRGB(100,255,100)
end

local K
for L,M in pairs(a:GetPlayers())do
if M.Name:lower()==I then
K=M
break
end
end

if K then
cleanupVIPField()
local L=e.Character or e.CharacterAdded:Wait()
local M=L:WaitForChild"HumanoidRootPart"
i=M.CFrame
if not h then
executeWardrobeSequence()
h=true
end
task.spawn(function()monitorTargetForSauce(K)end)
p=K
else
C.TextColor3=Color3.fromRGB(255,100,100)
C.Text="Player not found ❌"
end
end

x.MouseButton1Click:Connect(checkPlayerAndRun)




function setFollow(I)
l=I
local J=e.Character or e.CharacterAdded:Wait()
local K=J:WaitForChild"HumanoidRootPart"
local L=c.RemoteEvents:WaitForChild"Equip"
local M=c.RemoteEvents:WaitForChild"Drop"

if I then
A.BackgroundColor3=Color3.fromRGB(100,255,100)
A.Text="Follow: ON"
j=b.Heartbeat:Connect(function()
if p and p.Character and p.Character:FindFirstChild"HumanoidRootPart"then
local N=p.Character.HumanoidRootPart
local O=p.Character:FindFirstChild"Invisible Pink Sauce"

if O and O:IsA"Tool"then
if not k then
L:FireServer(o)
end
K.CFrame=N.CFrame
k=true
else
if k then
M:FireServer(o)
if i then
K.CFrame=i
end
k=false
end
end
end
end)
else
A.BackgroundColor3=Color3.fromRGB(200,40,40)
A.Text="Follow: OFF"
if j then
j:Disconnect()
j=nil
end
if k then
M:FireServer(o)
if i then
K.CFrame=i
end
k=false
end
end
end




function setAlwaysFollow(I)
m=I
local J=e.Character or e.CharacterAdded:Wait()
local K=J:WaitForChild"HumanoidRootPart"

if I then
B.BackgroundColor3=Color3.fromRGB(100,255,100)
B.Text="Always Follow: ON"
local L=false
n=b.Heartbeat:Connect(function()
if p and p.Character and p.Character:FindFirstChild"HumanoidRootPart"then
K.CFrame=p.Character.HumanoidRootPart.CFrame
local M=p.Character:FindFirstChild"Invisible Pink Sauce"
if not(M and M:IsA"Tool")then
if not L then
local N=c.RemoteEvents:WaitForChild"Drop"
N:FireServer(o)
L=true
end
else
L=false
end
end
end)
else
B.BackgroundColor3=Color3.fromRGB(200,40,40)
B.Text="Always Follow: OFF"
if n then
n:Disconnect()
n=nil
end
if i then
K.CFrame=i
end
end
end




local I=false
local J=false
local K

local function setXRay(L)
I=L
if e:FindFirstChild"XRay"and e.XRay:IsA"BoolValue"then
e.XRay.Value=L
end
if L then
y.BackgroundColor3=Color3.fromRGB(100,255,100)
y.Text="XRay: ON"
else
y.BackgroundColor3=Color3.fromRGB(200,40,40)
y.Text="XRay: OFF"
end
end

local function setNoSit(L)
J=L
if L then
z.BackgroundColor3=Color3.fromRGB(100,255,100)
z.Text="No Sit: ON"
K=b.RenderStepped:Connect(function()
local M=e.Character
if M then
local N=M:FindFirstChildOfClass"Humanoid"
if N and N.Sit then
N.Sit=false
end
end
end)
else
z.BackgroundColor3=Color3.fromRGB(200,40,40)
z.Text="No Sit: OFF"
if K then
K:Disconnect()
K=nil
end
end
end

y.MouseButton1Click:Connect(function()setXRay(not I)end)
z.MouseButton1Click:Connect(function()setNoSit(not J)end)
setXRay(false)
setNoSit(false)
