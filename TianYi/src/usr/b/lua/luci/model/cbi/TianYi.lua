require("luci.sys")

m = Map("TianYi", translate("TianYi"), translate("TianYi clinet"))

s = m:section(TypedSection, "login", "")
s.addremove = false
s.anonymous = true

enable = s:option(Flag, "enable", translate("Enable"))
name = s:option(Value, "username", translate("Username"))
name.rmempty  = false
pass = s:option(Value, "password", translate("Password"))
pass.password = true
pass.rmempty  = false
nasip = s:option(Value, "nasip", translate("wlanacip"))
nasip.datatype = "ipaddr"
nasip.rmempty  = false
phone = s:option(Flag, "phone", translate("secend clinet"),translate("simulate phone clinet"))

local apply = luci.http.formvalue("cbi.apply")
if apply then
    io.popen(" /etc/init.d/TianYi restart")
end

return m


