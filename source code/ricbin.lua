#!/usr/bin/lua
-- binary search on a numeric array

-- binary search function
function search(n1, n2, val)
   if n1 + 1 == n2 then return n1, n2 end
   
   local p = math.floor((n1+n2)/2)
   if extractlon(p) > val then
      n2 = p
   else
      n1 = p
   end
   return search(n1, n2, val)
end

-- open data file
local filename = "datispettri.txt"
local f = assert(io.open( filename , "r" ))

-- read data line by line saving in a table
local sdata = {}

while true do
   local line = f:read("*line")
   if line == nil then break end
   sdata[#sdata+1]=line
end
f:close()

function extractlon(n)
 return tonumber(string.sub(sdata[n],7,12))
end

function extractlat(n)
 return tonumber(string.sub(sdata[n],14,19))
end

local minlon = extractlon(1)
local maxlon = extractlon(10751)

print("Delta lon: " .. maxlon-minlon)

print("First lat: " .. extractlat(1))

print("lon = 10.00: pos: ".. search(1,10751,sdata,10))

print("lon='last', pos= " .. search(1,10751,sdata,extractlon(#sdata)))