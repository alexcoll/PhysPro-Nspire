

------------------------
-- Start of about.lua --
------------------------

--[[

PhysPro v1.3.0.1
alex3yoyo (Mr-Kitty)
LGLP 3 License

Orignal code:
(Jan 18th 2013)
FormulaPro v1.4b    LGLP 3 License
Jim Bauwens         Adrien Bertrand
TI-Planet.org       Inspired-Lua.org
]]--

pInfo = {
    name="PhysPro-Nspire",
    by="alex3yoyo",
    ver="v1.3.0.1",
    web="http://github.com/alex3yoyo/physpro-nspire",
    license="LGPL3 License"
}

infoStr = pInfo.name.." "..pInfo.ver.."\nBy "..pInfo.by.."\n"..pInfo.license.."\n"..pInfo.web
print("\n"..infoStr.."\n")
----------------------
-- End of about.lua --
----------------------

----------------------------------
-- Start of database/dbmain.lua --
----------------------------------

-----------------------------------
-- Start of database/symbols.lua --
-----------------------------------

function utf8(n)
    return string.uchar(n)
end

SubNumbers={185, 178, 179, 8308, 8309, 8310, 8311, 8312, 8313}

function numberToSub(w,n)
    return w..utf8(SubNumbers[tonumber(n)])
end

-- The Greeks
g = {} -- Big    , Little   , Name
g.al = {utf8(913), utf8(945), "Alpha"}
g.be = {utf8(914), utf8(946), "Beta"}
g.ga = {utf8(915), utf8(947), "Gamma"}
g.de = {utf8(916), utf8(948), "Delta"}
g.ep = {utf8(917), utf8(949), "Epsilon"}
g.ze = {utf8(918), utf8(950), "Zeta"}
g.et = {utf8(919), utf8(951), "Eta"}
g.th = {utf8(920), utf8(952), "Theta"}
g.io = {utf8(921), utf8(953), "Iota"}
g.ka = {utf8(922), utf8(954), "Kappa"}
g.la = {utf8(923), utf8(955), "Lambda"}
g.mu = {utf8(924), utf8(956), "Mu"}
g.nu = {utf8(925), utf8(957), "Nu"}
g.xi = {utf8(926), utf8(958), "Xi"}
g.om = {utf8(927), utf8(959), "Omicron"}
g.pi = {utf8(928), utf8(960), "Pi"}
g.rh = {utf8(929), utf8(961), "Rho"}
g.si = {utf8(931), utf8(963), "Sigma"}
g.ta = {utf8(932), utf8(964), "Tau"}
g.up = {utf8(933), utf8(965), "Upsilon"}
g.ph = {utf8(934), utf8(966), "Phi"}
g.ch = {utf8(935), utf8(967), "Chi"}
g.ps = {utf8(936), utf8(968), "Psi"}
g.om = {utf8(937), utf8(969), "Omega"}

s      = {} -- Symbols
s.sph  = utf8(8315)     -- superscript (sp) "-"
s.sp0  = utf8(8304)     -- sp "0"
s.sp1  = utf8(185)      -- sp "1"
s.sp2  = utf8(178)      -- sp "2"
s.sp3  = utf8(179)      -- sp "3"
s.sp4  = utf8(8308)     -- sp "4"
s.sp5  = utf8(8309)     -- sp "5"
s.sp6  = utf8(8310)     -- sp "6"
s.sp7  = utf8(8311)     -- sp "7"
s.sp8  = utf8(8312)     -- sp "8"
s.sp9  = utf8(8313)     -- sp "9"
s.sp1h = s.sph..s.sp1   -- sp "-1"
s.sp2h = s.sph..s.sp2   -- sp "-2"
s.sb1  = utf8(8321)     -- sb "1"
s.sb2  = utf8(8322)     -- Subscript (sb) "2"
s.bul  = utf8(8729)     -- Bullet operator
s.dg   = utf8(176)      -- Degree symbol
s.th0  = g.th[2].."0"   -- Theta0
s.la0  = g.la[2].."0"   -- Lambda0
s.dv   = g.de[1].."v"   -- Change in velocity
s.dpm  = g.de[1].."pm"  -- Change in momentum
s.dt   = g.de[1].."t"   -- Change in time
s.dh   = g.de[1].."h"   -- Change in height
s.dtt  = g.de[1].."TT"  -- Change in tempurature
s.dvl  = g.de[1].."V"   -- Change in volume
s.dn   = g.de[1].."N"   -- Change in amount of nuclei
s.Omm  = g.om[1]..s.bul.."m" -- Resistivity unit (ohms * meter)
s.m2   = "m"..s.sp2     -- m2
s.m3   = "m"..s.sp3     -- m3
s.ms2  = "m/s"..s.sp2   -- m/s2
s.kgm3 = "kg/m"..s.sp3  -- kg/m3
s.ns   = "N"..s.bul.."s"    -- N*s
s.ep0  = g.ep[2].."0"
s.mu0  = g.mu[2].."0"
s.dph  = g.de[1]..g.ph[1]
s.jkgk = "J/kg"..s.bul.."K" -- J/kg*K
---------------------------------
-- End of database/symbols.lua --
---------------------------------

-------------------------------------
-- Start of database/constants.lua --
-------------------------------------

Constants = {
{key="g",       info="- Acceleration of gravity",   val="-9.81",            unit="m/s"..s.sp2},
{key="+g",      info="+ Acceleration of gravity",   val="9.81",             unit="m/s"..s.sp2},
{key="G",       info="Gravitational constant",      val="6.67*10^(-11)",    unit="Nm"..s.sp2.."/kg"..s.sp2h},
{key="N",       info="Avogadro's constant",         val="6.022*10^(23)",    unit="mol"..s.sp1h},
{key="R",       info="Gas constant",                val="8.314",            unit="J/((mol"..s.sp1h..")"..s.bul.."(K"..s.sp1h.."))"},
{key="k1",      info="Boltzmann's constant",        val="1.38*10^(-23)",    unit="J/K"..s.sp1h},
{key="k2",      info="Coulomb constant",            val="8.99*10^9",        unit="N"..s.bul.."m"..s.sp2..s.bul.."C"..s.sp2h},
{key=g.si[2],   info="Stefan-Boltzmann constant",   val="5.67*10^-8",       unit="W"..s.bul.."m"..s.sp2h..s.bul.."K"..s.sp1h},
{key="C",       info="Speed of light in vacuum",    val="2.9979*10^(8)",    unit="m/s"},
{key="h",       info="Planck constant",             val="6.626*10^(-34)",   unit="J/s"},
{key="q",       info="Elementary charge",           val="1.60218*10^(-19)", unit="C"},
{key="me",      info="Electron rest mass",          val="9.109*10^(-31)",   unit="kg"},
{key="mp",      info="Proton rest mass",            val="1.6726*10^(-27)",  unit="kg"},
{key="mn",      info="Neutron rest mass",           val="1.675*10^(-27)",   unit="kg"},
{key="mu",      info="Atomic mass unit",            val="1.66*10^(-27)",    unit="kg"},
{key=s.ep0,     info="Permittivity of a vacuum",    val="8.854*10^(-12)",   unit="F/m"..s.sp1h},
{key=s.mu0,     info="Permeability of a vacuum",    val="4*pi*10^(-7)",     unit="N/A"..s.sp2h}
}
-----------------------------------
-- End of database/constants.lua --
-----------------------------------

--------------------------------
-- Start of database/chem.lua --
--------------------------------

-- Chemistry values
function initElementValues() -- Stores elements into nspire documents variables
    local elementValues = {
        ["ch.mass"] = [[Define ch.mass = { 1.00794, 4.002602, 6.941, 9.012182, 10.811, 12.0107, 14.00674, 15.9994, 18.9984032, 20.1797, 22.98976928, 24.305, 26.9815386, 28.0855, 30.973762, 32.065, 35.4527, 39.948, 39.0983, 40.078, 44.955912, 47.867, 50.9415, 51.9961, 54.938045, 55.845, 58.933195, 58.6934, 63.546, 65.409, 69.723, 72.64, 74.9216, 78.96, 79.904, 83.798, 85.4678, 87.62, 88.90585, 91.224, 92.90638, 95.96, 98, 101.07, 102.9055, 106.42, 107.8682, 112.411, 114.818, 118.71, 121.76, 127.6, 126.90447, 131.293, 132.9054519, 137.327, 138.90547, 140.116, 140.90765, 144.242, 145, 150.36, 151.964, 157.25, 158.92535, 162.5, 164.93032, 167.259, 168.93421, 173.054, 174.9668, 178.49, 180.94788, 183.84, 186.207, 190.23, 192.217, 195.084, 196.966569, 200.59, 204.3833, 207.2, 208.9804, 209, 210, 222, 223, 226, 227, 232.03806, 231.03588, 238.02891, 237, 244, 243, 247, 247, 251, 252, 257, 258, 259, 262, 261, 262, 266, 264, 277, 268, 271, 272, 285, 284, 289, 288, 293, undef, 294 }]],
        ["ch.dens"] = [[Define ch.dens = { 0.0899, 0.1785, 535, 1848, 2460, 2260, 1.251, 1.429, 1.696, 0.9, 968, 1738, 2700, 2330, 1823, 1960, 3.214, 1.784, 856, 1550, 2985, 4507, 6110, 7140, 7470, 7874, 8900, 8908, 8920, 7140, 5904, 5323, 5727, 4819, 3120, 3.75, 1532, 2630, 4472, 6511, 8570, 10280, 11500, 12370, 12450, 12023, 10490, 8650, 7310, 7310, 6697, 6240, 4940, 5.9, 1879, 3510, 6146, 6689, 6640, 7010, 7264, 7353, 5244, 7901, 8219, 8551, 8795, 9066, 9321, 6570, 9841, 13310, 16650, 19250, 21020, 22610, 22650, 21090, 19300, 13534, 11850, 11340, 9780, 9196, undef, 9.73, undef, 5000, 10070, 11724, 15370, 19050, 20450, 19816, undef, 13510, 14780, 15100, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef }]],
        ["ch.c"] = [[Define ch.c = { 14300, 5193.1, 3570, 1820, 1030, 710, 1040, 919, 824, 1030., 1230, 1020, 904, 710, 769.7, 705, 478.2, 520.33, 757, 631, 567, 520, 489, 448, 479, 449, 421, 445, 384.4, 388, 371, 321.4, 328, 321.2, 947.3, 248.05, 364, 300, 298, 278, 265, 251, 63, 238, 240, 240, 235, 230, 233, 217, 207, 201, 429., 158.32, 242, 205, 195, 192, 193, 190, undef, 196, 182, 240, 182, 167, 165, 168, 160, 154, 154, 144, 140, 132, 137, 130, 131, 133, 129.1, 139.5, 129, 127, 122, undef, undef, 93.65, undef, 92., 120, 118, 99.1, 116, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef }]],
        ["ch.melt"] = [[Define ch.melt = { 14.01, 0.95, 453.69, 1560, 2348, 3823, 63.05, 54.8, 53.5, 24.56, 370.87, 923, 933.47, 1687, 317.3, 388.36, 171.6, 83.8, 336.53, 1115, 1814, 1941, 2183, 2180, 1519, 1811, 1768, 1728, 1357.77, 692.68, 302.91, 1211.4, 1090, 494, 265.8, 115.79, 312.46, 1050, 1799, 2128, 2750, 2896, 2430, 2607, 2237, 1828.05, 1234.93, 594.22, 429.75, 505.08, 903.78, 722.66, 386.85, 161.3, 301.59, 1000, 1193, 1071, 1204, 1294, 1373, 1345, 1095, 1586, 1629, 1685, 1747, 1770, 1818, 1092, 1936, 2506, 3290, 3695, 3459, 3306, 2739, 2041.4, 1337.33, 234.32, 577, 600.61, 544.4, 527, 575, 202, 300, 973, 1323, 2023, 1845, 1408, 917, 913, 1449, 1618, 1323, 1173, 1133, 1800, 1100, 1100, 1900, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef }]],
        ["ch.boil"] = [[Define ch.boil = { 20.28, 4.22, 1615, 2743, 4273, 4300, 77.36, 90.2, 85.03, 27.07, 1156, 1363, 2792, 3173, 553.6, 717.87, 239.11, 87.3, 1032, 1757, 3103, 3560, 3680, 2944, 2334, 3134, 3200, 3186, 3200, 1180, 2477, 3093, 887, 958, 332, 119.93, 961, 1655, 3618, 4682, 5017, 4912, 4538, 4423, 3968, 3236, 2435, 1040, 2345, 2875, 1860, 1261, 457.4, 165.1, 944, 2143, 3737, 3633, 3563, 3373, 3273, 2076, 1800, 3523, 3503, 2840, 2973, 3141, 2223, 1469, 3675, 4876, 5731, 5828, 5869, 5285, 4701, 4098, 3129, 629.88, 1746, 2022, 1837, 1235, 610, 211.3, 950, 2010, 3473, 5093, 4273, 4200, 4273, 3503, 2284, 3383, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef }]],
        ["ch.h_fus"] = [[Define ch.h_fus = { 0.558, 0.02, 3., 7.95, 50, 105, 0.36, 0.222, 0.26, 0.34, 2.6, 8.7, 10.7, 50.2, 0.64, 1.73, 3.2, 1.18, 2.33, 8.54, 16, 18.7, 22.8, 20.5, 13.2, 13.8, 16.2, 17.2, 13.1, 7.35, 5.59, 31.8, 27.7, 5.4, 5.8, 1.64, 2.19, 8, 11.4, 21, 26.8, 36, 23, 25.7, 21.7, 16.7, 11.3, 6.3, 3.26, 7., 19.7, 17.5, 7.76, 2.3, 2.09, 8., 6.2, 5.5, 6.9, 7.1, 7.7, 8.6, 9.2, 10, 10.8, 11.1, 17., 19.9, 16.8, 7.7, 22, 25.5, 36, 35, 33, 31, 26, 20, 12.5, 2.29, 4.2, 4.77, 10.9, 13, 6, 3, 2, 8, 14, 16, 15, 14, 10, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef }]],
        ["ch.h_vap"] = [[Define ch.h_vap = { 0.452, 0.083, 147, 297, 507, 715, 2.79, 3.41, 3.27, 1.75, 97.7, 128, 293, 359, 12.4, 9.8, 10.2, 6.5, 76.9, 155, 318, 425, 453, 339, 220, 347, 375, 378, 300, 119, 256, 334, 32.4, 26, 14.8, 9.02, 72, 137, 380, 580, 690, 600, 550, 580, 495, 380, 255, 100, 230, 290, 68, 48, 20.9, 12.64, 65, 140, 400, 350, 330, 285, 290, 175, 175, 305, 295, 280, 265, 285, 250, 160, 415, 630, 735, 800, 705, 630, 560, 490, 330, 59.2, 165, 178, 160, 100, 40, 17, 65, 125, 400, 530, 470, 420, 335, 325, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef, undef }]]
        --["ch.sym"] = [[Define ch.sym = { "H", "He", "Li", "Be", "B", "C", "N", "O", "F", "Ne", "Na", "Mg", "Al", "Si", "P", "S", "Cl", "Ar", "K", "Ca", "Sc", "Ti", "V", "Cr", "Mn", "Fe", "Co", "Ni", "Cu", "Zn", "Ga", "Ge", "As", "Se", "Br", "Kr", "Rb", "Sr", "Y", "Zr", "Nb", "Mo", "Tc", "Ru", "Rh", "Pd", "Ag", "Cd", "In", "Sn", "Sb", "Te", "I", "Xe", "Cs", "Ba", "La", "Ce", "Pr", "Nd", "Pm", "Sm", "Eu", "Gd", "Tb", "Dy", "Ho", "Er", "Tm", "Yb", "Lu", "Hf", "Ta", "W", "Re", "Os", "Ir", "Pt", "Au", "Hg", "Tl", "Pb", "Bi", "Po", "At", "Rn", "Fr", "Ra", "Ac", "Th", "Pa", "U", "Np", "Pu", "Am", "Cm", "Bk", "Cf", "Es", "Fm", "Md", "No", "Lr", "Rf", "Db", "Sg", "Bh", "Hs", "Mt", "Ds", "Rg", "Uub", "Uut", "Uuq", "Uup", "Uuh", "Uus", "Uuo" }]]
    }
    for k,v in pairs(elementValues) do
        math.eval(v) -- stores
        math.eval("Lock "..k) -- Locks the loaded lists
    end
end

--[[
function getChem(k, v)
    if v >= 1 and v <= # ch.atom then
        return ch[k][v]
    else
        return 0
    end
end
]]--
------------------------------
-- End of database/chem.lua --
------------------------------


ct    = {} -- Set position of each section
-- ct.t1 = 1   -- Topic 1
ct.mo = 1   -- Mechanics
ct.th = 2   -- Thermal physics
ct.wa = 3   -- Oscillations & Waves
ct.ec = 4   -- Electric curents
ct.fo = 5   -- Forces and Fields
ct.nu = 6   -- Atomic and Nuclear
ct.en = 7   -- Energy, Climate Change
ct.ch = 8   -- Chemistry
ct.ex = 9   -- External Database

function con(i) -- Shortcut for using constants in the database part
    for k,v in ipairs(Constants) do
        if Constants[k].key == i then
            return Constants[k].val
        end
    end
    return "undef"
end

function refCon() -- Makes the constants reference page
    local t2 = {}

    for k,v in ipairs(Constants) do
        t2[k] = {v.info,v.key,v.val.." "..v.unit}
    end
    return t2
end

function checkIfExists(table, name)
    for k,v in pairs(table) do
        if (v.name == name) or (v == name) then
            print("Conflict (element appearing twice) detected when loading Database. Skipping the item.")
            return true
        end
    end
    return false
end

function checkIfFormulaExists(table, formula)
    for k,v in pairs(table) do
        if (v.formula == formula)  then
            print("Conflict (formula appearing twice) detected when loading Database. Skipping the item.")
            return true
        end
    end
    return false
end

Categories = {}
Formulas   = {}

function addCat(id,name,info)
    if checkIfExists(Categories, name) then
        print("Warning ! This category appears to exist already ! Adding anyway....")
    end
    return table.insert(Categories, id, {id=id, name=name, info=info, sub={}, varlink={}})
end

function addCatVar(cid, var, info, unit)
    Categories[cid].varlink[var] = {unit=unit, info=info }
end

function addSubCat(cid, id, name, info)
    if checkIfExists(Categories[cid].sub, name) then
        print("Warning ! This subcategory appears to exist already ! Adding anyway....")
    end
    return table.insert(Categories[cid].sub, id, {category=cid, id=id, name=name, info=info, formulas={}, variables={}})
end

function aF(cid, sid, formula, variables) --add Formula
    local fr = {category=cid, sub=sid, formula=formula, variables=variables}
    -- In times like this we are happy that inserting tables just inserts a reference

    -- commented out this check because only the subcategory duplicates should be avoided, and not on the whole db.
    --if not checkIfFormulaExists(Formulas, fr.formula) then
        table.insert(Formulas, fr)
    --end
    if not checkIfFormulaExists(Categories[cid].sub[sid].formulas, fr.formula) then
        table.insert(Categories[cid].sub[sid].formulas, fr)
    end

    -- This function might need to be merged with U(...)
    for variable,_ in pairs(variables) do
        Categories[cid].sub[sid].variables[variable] = true
    end
end

function U(...)
    local out = {}
    for i, p in ipairs({...}) do
        out[p] = true
    end
    return out
end

------------------------------------
-- Start of database/database.lua --
------------------------------------

-- Almost all formulas are from the IB Physics HL Data Booklet, which contains the fundamental equations needed throughout the course. It does not contain every physics equation know to man, nor is every Data Booklet equation included in this database.


--addCat(ct.t1, "Physics and physical measurement", "IB Topic 1. ￼Note: All equations relate to the magnitude of the quantities only. Vector notation has not been used.")


addCat(ct.mo, "Mechanics", "IB topic 2. Perform motion-related calculations")

addCatVar(ct.mo, "u",   "Intial velocity", "m/s")
addCatVar(ct.mo, "v",   "Final velocity", "m/s")
addCatVar(ct.mo, s.dv,  "Change in velocity", "m/s")
addCatVar(ct.mo, "s",   "Displacement", "m")
addCatVar(ct.mo, "t",   "Final time", "s")
addCatVar(ct.mo, "t0",  "Initial time", "s")
addCatVar(ct.mo, s.dt,  "Change in time", "s")
addCatVar(ct.mo, "a",   "Accleration", s.ms2)
addCatVar(ct.mo, "F",   "Force", "N")
addCatVar(ct.mo, "m",   "Mass", "kg")
addCatVar(ct.mo, "W",   "Work", "J")
addCatVar(ct.mo, "P",   "Power", "W")
addCatVar(ct.mo, s.dh,  "Change in height", "m")
addCatVar(ct.mo, "imp", "Impulse", s.ns)
addCatVar(ct.mo, "pm",  "Final momentum", s.ns)
addCatVar(ct.mo, "pm0", "Initial momentum", s.ns)
addCatVar(ct.mo, s.dpm, "Change in momentum", s.ns)
addCatVar(ct.mo, "Epg", "gravitational potential energy", "J")
addCatVar(ct.mo, "Ek",  "Kinetic energy (translational)", "J")
addCatVar(ct.mo, "TME", "Total mechanical energy", "J")
addCatVar(ct.mo, g.th[2],  "Angle", s.dg)
addCatVar(ct.mo, "Tp",  "Period", "s")
addCatVar(ct.mo, "c",   "Circumference", "m")
addCatVar(ct.mo, "r",   "Radius", "m")
addCatVar(ct.mo, "ca",  "Centripital acceleration", "m/s"..s.sp2)
addCatVar(ct.mo, "cF",  "Centripital force", "N")
addCatVar(ct.mo, "cv",  "Centripital velocity", "m/s")

addSubCat(ct.mo, 1, "Kinematics", "")
aF(ct.mo, 1, "s=((u+v)/2)*"..s.dt, U("s", "u", "v", s.dt) )
aF(ct.mo, 1, "s=u*"..s.dt.."+(1/2)*a*"..s.dt.."^(2)", U("s", "u", s.dt, "a") )
aF(ct.mo, 1, "v^(2)=u^(2)+2*a*s", U("v", "u", "a", "s") )
aF(ct.mo, 1, "v=u+a*"..s.dt, U("v", "u", "a", s.dt) )
aF(ct.mo, 1, s.dt.."=t-t0", U(s.dt, "t", "t0") )
aF(ct.mo, 1, s.dv.."=v-u", U(s.dv, "v", "u") )

addSubCat(ct.mo, 2, "Force", "")
aF(ct.mo, 2, "F=m*a", U("F", "m", "a") )

addSubCat(ct.mo, 3, "Impulse (WIP)", "") -- Very confusing
aF(ct.mo, 3, "F*t=m*"..s.dv, U("F", "t", "m", s.dv) ) -- impulse-momentum change equation
aF(ct.mo, 3, s.dv.."=v-u", U(s.dv, "v", "u") ) -- change in velocity
aF(ct.mo, 3, "pm0=m*u", U("pm0", "m", "u") ) -- initial momentum
aF(ct.mo, 3, "pm=m*v", U("pm", "m", "v") ) -- final momentum
aF(ct.mo, 3, "imp=pm-pm0", U("imp", "pm", "pm0") ) -- change in momentum
aF(ct.mo, 3, "imp=F*t", U("imp", "F", "t") ) -- impulse
aF(ct.mo, 3, "imp=m*"..s.dv, U("imp", "m", s.dv) ) -- delta-momentum
aF(ct.mo, 3, "F=m*a", U("F", "m", "a") ) -- force
--aF(ct.mo, 3, "pm=m*v-m*u", U("pm", "m", "v", "u") )

addSubCat(ct.mo, 4, "Work", "")
aF(ct.mo, 4, "W=F*s*cos("..g.th[2]..")", U("W", "F", g.th[2], "s") )
aF(ct.mo, 4, "W=(1/2)*m*(v^(2)-u^(2))", U("W", "m", "v", "u") )
aF(ct.mo, 4, "F=m*a", U("F", "m", "a") )
aF(ct.mo, 4, s.dv.."=v-u", U(s.dv, "v", "u") )

addSubCat(ct.mo, 5, "Energy", "")
aF(ct.mo, 5, "Ek=(1/2)*m*v^2", U("Ek", "m", "v") ) -- kinetic energy
aF(ct.mo, 5, "Ek=pm^2/(2*m)", U("Ek", "pm", "m") ) -- kinetic energy
aF(ct.mo, 5, "Epg=m*"..s.dh.."*("..con("g")..")", U("Epg", "m", s.dh) ) -- gravity potential energy
aF(ct.mo, 5, "TME=Ek+Epg", U("TME", "Ek", "Epg") ) -- total mechanical energy

addSubCat(ct.mo, 6, "Power", "")
aF(ct.mo, 6, "P=W/"..s.dt, U("P", "W", s.dt) ) -- power (work/time)
aF(ct.mo, 6, "P=F*(s/"..s.dt, U("P", "F", "s", s.dt) ) -- power (force*(displacement/time))
aF(ct.mo, 6, "W=F*v", U("W", "F", "v") ) -- work
aF(ct.mo, 6, "F=m*a", U("F", "m", "a") ) -- force
aF(ct.mo, 6, s.dv.."=s/"..s.dt, U(s.dv, "s", s.dt) )

addSubCat(ct.mo, 7, "Centripital", "" )
aF(ct.mo, 7, "cF=(m*cv^2)/r", U("cF", "m", "cv", "r") )
aF(ct.mo, 7, "ca=(4*pi^2*r)/Tp^2", U("ca", "r", "Tp") )
aF(ct.mo, 7, "ca=cv^2/r^2", U("ca", "cv", "r") )
aF(ct.mo, 7, "c=2*pi*r", U("c", "r") )


addCat(ct.th, "Thermal physics", "IB topic 3 & 10. Perform thermal related physics calculations.")

addCatVar(ct.th, "P",   "Pressure", "Pa")
addCatVar(ct.th, "V",   "Volume", "m"..s.sp3)
addCatVar(ct.th, "T",   "Tempturature", "K")
addCatVar(ct.th, "n",   "Amount", "mol")
addCatVar(ct.th, "m",   "Mass", "kg")
addCatVar(ct.th, "amu", "Molecular mass", "amu")
addCatVar(ct.th, "F",   "Force", "N")
addCatVar(ct.th, "A",   "Area", "m"..s.sp2)
addCatVar(ct.th, "Ek",  "Kinetic energy (translational)", "J")
addCatVar(ct.th, "Q",   "Heat", "J")
addCatVar(ct.th, "c",   "Specific heat capacity", "J/kg"..s.bul.."K")
addCatVar(ct.th, "L",   "Latent heat", "nounit")
addCatVar(ct.th, "tK",  "Kelvin", "nounit")
addCatVar(ct.th, "tC",  "Celcius", "nounit")
addCatVar(ct.th, "tF",  "Farhenhiet", "nounit")

addSubCat(ct.th, 1, "Tempurature", "")
aF(ct.th, 1, "tF=(9/5)*tC+32", U("tC", "tF") )
aF(ct.th, 1, "tK=tC+273.15", U("tK", "tC") )

addSubCat(ct.th, 2, "Thermal", "")
aF(ct.th, 2, "P*V=n*("..con("R")..")*T", U("P", "V", "n", "T") )
aF(ct.th, 2, "n=m/amu", U("n", "m", "amu") )
aF(ct.th, 2, "P=F/A", U("P", "F", "A") )
aF(ct.th, 2, "Ek=(3/2)*("..con("k1")..")*T", U("Ek", "T") )

addSubCat(ct.th, 3, "Heat Capacity", "")
aF(ct.th, 3, "Q=c*m*T", U("Q", "c", "m", "T") )
aF(ct.th, 3, "Q=m*L", U("Q", "m", "L") )


addCat(ct.wa, "Oscillations and Waves", "IB Topic 4. Perform wave-related calculations")

addCatVar(ct.wa, "F",       "Force", "N")
addCatVar(ct.wa, "K",       "Spring constant", "N/m")
addCatVar(ct.wa, "x",       "Displacement", "m")
addCatVar(ct.wa, "m",       "Mass", "kg")
addCatVar(ct.wa, "a",       "Acceleration", "m/s"..s.sp2)
addCatVar(ct.wa, "Ep",      "Elastic potential energy", "J")
addCatVar(ct.wa, "T",       "Period", "s")
addCatVar(ct.wa, "fq",      "Frequency", "Hz")
addCatVar(ct.wa, "v",       "Velocity", "m/s")
addCatVar(ct.wa, "v0",      "Velocity", "m/s")
addCatVar(ct.wa, "n",       "Refraction index", "nounit")
addCatVar(ct.wa, "n0",      "Refraction index", "nounit")
addCatVar(ct.wa, g.th[2],   "Angle", s.dg)
addCatVar(ct.wa, s.th0,     "Angle", s.dg)
addCatVar(ct.wa, g.la[2],   "Wavelength", "m")
addCatVar(ct.wa, s.la0,     "Wavelength", "m")

addSubCat(ct.wa, 1, "Waves", "")
aF(ct.wa, 1, "F=m*a", U("F", "m", "a") ) -- force
aF(ct.wa, 1, "F=-K*x", U("F", "K", "x") ) -- force (spring_constant * displacement)
aF(ct.wa, 1, "Ep=0.5*K*(x)^2", U("Ep", "K") )
aF(ct.wa, 1, "a=(-K/m)*x", U("a", "K", "m", "x") )
aF(ct.wa, 1, "T=2*pi*sqrt(m/K)", U("T", "m", "K") )
aF(ct.wa, 1, "v="..g.la[2].."/T", U("v", g.la[2], "T") )
aF(ct.wa, 1, "v=fq*"..g.la[2], U("v", "fq", g.la[2]) )

addSubCat(ct.wa, 2, "Reflections & Refractions", "")
aF(ct.wa, 2, "n/n0=sin("..s.th0..")/sin("..g.th[2]..")=v0/v", U("n", "n0", s.th0, g.th[2], "v0", "v") )
aF(ct.wa, 2, "n=("..con("C")..")/v", U("n", "v") )
aF(ct.wa, 2, "n0=("..con("C")..")/v0", U("n0", "v0") )
aF(ct.wa, 2, "v=fq*"..g.la[2], U("v", "fq", g.la[2] ) )
aF(ct.wa, 2, "v0=fq*"..s.la0, U("v0", "fq", s.la0 ) )
--aF(ct.wa, 2, "v/"..g.la[2].."=v0/"..s.la0, U("v", "v0", g.la[2], s.la0) )

-- addSubCat(ct.wa, 3, "Wave phenomena", "")

-- addSubCat(ct.wa, 4, "Sight and wave phenomena", "")


addCat(ct.ec, "Electric Curents", "IB Topic 5 & 12.")

addCatVar(ct.ec, "q",       "Charge",       "C")
addCatVar(ct.ec, "t",       "Time",         "s")
addCatVar(ct.ec, "I",       "Current",      "A")
addCatVar(ct.ec, "R",       "Resistence",       g.om[1])
addCatVar(ct.ec, "V",       "Voltage",          "V")
addCatVar(ct.ec, "P",       "Power",            "W")
addCatVar(ct.ec, g.rh[2],   "Resistivity",      s.Omm)
addCatVar(ct.ec, "A",       "Cross-sectional area", "m"..s.sp2)
addCatVar(ct.ec, "L",       "Length",           "m")
addCatVar(ct.ec, "Ve",      "Energy",           "J")
addCatVar(ct.ec, "m",       "Mass",             "kg")
addCatVar(ct.ec, "vel",     "Velocity",         "m/s")
addCatVar(ct.ec, "r",       "Radius of wire",   "m")
addCatVar(ct.ec, "d",       "Diameter of wire", "m")
-- addCatVar(ct.ec, g.ph[1], "", "")
-- addCatVar(ct.ec, "B", "", "")
-- addCatVar(ct.ec, g.th[2], "Angle", s.dg)
-- addCatVar(ct.ec, "N", "", "")
-- addCatVar(ct.ec, s.dep, "Change in", "")
-- addCatVar(ct.ec, s.dr, "", "")

addSubCat(ct.ec, 1, "Electrostatic", "")
aF(ct.ec, 1, "Ve=0.5*m*vel^2", U( "Ve", "m", "vel") )

addSubCat(ct.ec, 2, "Electricity", "")
aF(ct.ec, 2, "I=q/t", U("I", "q", "t") )
aF(ct.ec, 2, "R=V/I", U("R", "V", "I") )
aF(ct.ec, 2, "P=V*I", U("P", "V", "I") )
aF(ct.ec, 2, "P=I^2*R", U("P", "I", "R") )
aF(ct.ec, 2, "P=V^2/R", U("P", "V", "R") )
aF(ct.ec, 2, "R=("..g.rh[2].."*L)/A", U("R", g.rh[2], "L", "A") )
aF(ct.ec, 2, "A=pi*r^2", U("A", "r") )
aF(ct.ec, 2, "r=d/2", U("r", "d") )

-- addSubCat(ct.ec, 3, "Electromagnetic Induction", "")
-- aF(ct.ec, 3, g.ph[1].."=B*A*cos("..g.th[2]..")", U(g.ph[1], "B", "A", g.th[2]) )
-- aF(ct.ec, 3, g.ep[2].."=B*vel*l", U(g.ep[2], "B", "vel", "l") )
-- aF(ct.ec, 3, g.ep[2].."-N*("..s.dep.."/"..s.dt..")", U(g.ep[2], "N", s.dep, s.dt) )


addCat(ct.fo, "Forces and Fields", "IB topic 6. Includes electrosatic, gravitational, and magnetic fields")

addCatVar(ct.fo, "F",   "Force", "N")
addCatVar(ct.fo, "m1",  "Mass 1", "kg")
addCatVar(ct.fo, "m2",  "Mass 2", "kg")
addCatVar(ct.fo, "r",   "Distance", "m")
addCatVar(ct.fo, "q",   "Charge", "C")
addCatVar(ct.fo, "q1",  "Charge 1", "C")
addCatVar(ct.fo, "q2",  "Charge 2", "C")
addCatVar(ct.fo, "v",   "Velocity", "m/s")
addCatVar(ct.fo, g.th[2],  "Angle", s.dg)
addCatVar(ct.fo, "B",   "Teslas", "T")
addCatVar(ct.fo, "L",   "Length", "m")
addCatVar(ct.fo, "I",   "Current", "A")
-- addCatVar(ct.fo, "g", "?", "")
-- addCatVar(ct.fo, "E", "?", "")
-- addCatVar(ct.fo, "m", "Mass", "kg")

addSubCat(ct.fo, 1, "Gravitational", "Gravitational fields")
aF(ct.fo, 1, "F=("..con("G")..")*((m1*m2)/r^2)", U("F", "m1", "m2", "r") )
-- aF(ct.fo, 1, "g=F/m", U("g", "F", "m") )

addSubCat(ct.fo, 2, "Electrostatic", "Electrostatic fields")
aF(ct.fo, 2, "F=("..con("k2")..")*((q1*q2)/r^2)", U("F", "q1", "q2", "r") )
-- aF(ct.fo, 1, "E=F/q", U("E", "F", "q") )

addSubCat(ct.fo, 3, "Magnetic", "Magnetic fields")
aF(ct.fo, 3, "F=(q1*q2)/(4*pi*"..con(s.ep0).."*r^2)", U("F", "q1", "q2", "r") )
aF(ct.fo, 3, "F=q*v*B*sin("..g.th[2]..")", U("F", "q", "v", "B", g.th[2]) )
aF(ct.fo, 3, "F=B*I*L*sin("..g.th[2]..")", U("F", "B", "I", "L", g.th[2]) )

-- addSubCat(ct.fo, 4, "Motion in fields", "")

addCat(ct.nu, "Topic 7", "Atomic & nuclear physics")

addCatVar(ct.nu, "E",       "Energy", "J")
addCatVar(ct.nu, "m",       "Mass", "kg")
addCatVar(ct.nu, "hl",      "Half-life", "s")
addCatVar(ct.nu, "N",       "Present nuclei", "nuclei")
addCatVar(ct.nu, "N0",      "Inintial nuclei", "nuclei")
addCatVar(ct.nu, s.dn,      "Decayed nuclei", "nuclei")
addCatVar(ct.nu, "A",       "Decay rate", "Bq")
addCatVar(ct.nu, "t",       "Time", "s")
addCatVar(ct.nu, s.dt,      "Change in time", "s")
addCatVar(ct.nu, g.la[2],   "Decay constant", "nounit")
-- addCatVar(ct.nu, "h",       "", "") -- What is h?
-- addCatVar(ct.nu, "f",       "Frequency", "Hz")

addSubCat(ct.nu, 1, "Mass-Energy", "")
aF(ct.nu, 1, "E=m*("..con("C")..")^2", U("E", "m") )

addSubCat(ct.nu, 2, "Nuclear Decay", "")
aF(ct.nu, 2, s.dn.."=(-"..g.la[2]..")*N*"..s.dt, U(s.dn, g.la[2], "N", s.dt) )
aF(ct.nu, 2, "A=abs("..s.dn.."/"..s.dt..")", U("A", s.dn, s.dt) )
aF(ct.nu, 2, "A="..g.la[2].."*N", U("A", g.la[2], "N") )
aF(ct.nu, 2, "N=N0*exp(-("..g.la[2]..")*t)", U("N", "N0", g.la[2], "t") )
aF(ct.nu, 2, "hl=ln(2)/"..g.la[2], U("hl", g.la[2]) )
-- aF(ct.nu, 2, "E=h*f", U("E", "h", "f") )


addCat(ct.en, "Topic 8", "Energy, power, and climate change")

addCatVar(ct.en, "P",       "Power", "J")
addCatVar(ct.en, g.rh[2],   "Density", s.kgm3)
addCatVar(ct.en, "A",       "Area", s.m2)
addCatVar(ct.en, "r",       "Radius", "m")
addCatVar(ct.en, "h",       "Height", "m")
addCatVar(ct.en, "v",       "Velocity", "m/s")
addCatVar(ct.en, "ti",      "Time", "s")
addCatVar(ct.en, g.la[2],   "Wavelength", "m")
addCatVar(ct.en, "f",       "Frequency", "Hz")
addCatVar(ct.en, "T",       "Tempurature", "K")
addCatVar(ct.en, s.dvl,     "Change in volume", s.m3)
addCatVar(ct.en, "V0",      "Initial volume", s.m3)
addCatVar(ct.en, g.be[1],   "/K", "nounit")
addCatVar(ct.en, "Q",       "Heat", "J")
addCatVar(ct.en, "c",       "Specific heat capacity", "J/kg"..s.bul.."K")
addCatVar(ct.en, "L",       "Latent heat", "nounit")
addCatVar(ct.en, "m",       "Mass", "kg")
addCatVar(ct.en, "Pm2",     "Power/meter2", "W") -- For BBR

addSubCat(ct.en, 1, "Wind", "")
aF(ct.en, 1, "P=(1/2)*"..g.rh[2].."*A*v^3", U("P", g.rh[2], "A", "v") )
aF(ct.en, 1, "A=pi*r^2", U("A", "r") )

addSubCat(ct.en, 2, "Hydroelectric", "")
aF(ct.en, 2, "P="..g.rh[2].."*"..con("+g").."*h*(v/ti)", U("P", g.rh[2], "h", "v", "ti") )

addSubCat(ct.en, 3, "Tidal", "")
aF(ct.en, 3, "P=(1/2)*"..g.rh[2].."*"..con("+g").."*A^2*v", U("P", g.rh[2], "A", "v") )
aF(ct.en, 3, "v="..g.la[2].."*f", U("v", g.la[2], "f") )

addSubCat(ct.en, 4, "Solar", "")
-- aF(ct.en, 4, "", U("") )

addSubCat(ct.en, 5, "Black-Body Radiation", "") -- "BBR"
aF(ct.en, 5, "Pm2="..con(g.si[2]).."*T^4", U("Pm2", "T") )
aF(ct.en, 5, "P="..con(g.si[2]).."*A*T^4", U("P", "A", "T") )
aF(ct.en, 5, g.la[2].."=(2.90*10^-3)/T", U(g.la[2], "T") )
--aF(ct.en, 5, "P=e*"..con(s.si).."*A*T^4", U("P", "A", "T") )

addSubCat(ct.en, 6, "Volume Expansion", "")
aF(ct.en, 6, s.dvl.."="..g.be[1].."*V0*"..s.dtt, U(s.dvl, g.be[1], "V0", s.dtt) )
aF(ct.en, 6, "Q=c*m*T", U("Q", "c", "m", "T") )
aF(ct.en, 6, "Q=m*L", U("Q", "m", "L") )
--aF(ct.en, 6, "C=(Q)/(A*ti)", U("C", "Q", "A", "ti") )


addCat(ct.ch, "Chemestry", "Chemistry related things that have some connection to physics")

addCatVar(ct.ch, "atom",    "Atomic number",        "nounit")
addCatVar(ct.ch, "mass",    "Mass",                 "amu")
addCatVar(ct.ch, "dens",    "Density",              s.kgm3)
addCatVar(ct.ch, "c",       "Specific heat",        "J/kg*K")
addCatVar(ct.ch, "melt",    "Melting point",        "K")
addCatVar(ct.ch, "boil",    "Boiling point",        "K")
addCatVar(ct.ch, "h_fus",   "Heat of fusion",       "kJ/mol")
addCatVar(ct.ch, "h_vap",   "Heat of vaporization", "kJ/mol")
-- addCatVar(ct.ch, "sym",     "Symbol", "nounit")

addSubCat(ct.ch, 1, "Basic Properties", "")
aF(ct.ch, 1, "mass=ch.mass[atom]",      U( "mass", "atom")  )
aF(ct.ch, 1, "dens=ch.dens[atom]",      U( "dens", "atom")  )
aF(ct.ch, 1, "c=ch.c[atom]",            U( "c", "atom")     )
aF(ct.ch, 1, "melt=ch.melt[atom]",      U( "melt", "atom")  )
aF(ct.ch, 1, "boil=ch.boil[atom]",      U( "boil", "atom")  )
aF(ct.ch, 1, "h_fus=ch.h_fus[atom]",    U( "h_fus", "atom") )
aF(ct.ch, 1, "h_vap=ch.h_vap[atom]",    U( "h_vap", "atom") )
-- aF(ct.ch, 1, "sym=ch.sym[atom]", U( "sym", "atom") )
----------------------------------
-- End of database/database.lua --
----------------------------------

--------------------------------
-- Start of database/exdb.lua --
--------------------------------

--This part is supposed to load external formulas stored in a string from a file in MyLib.
--WIP

function loadExtDB()
    local err
    _, err = pcall(function()
        loadstring(math.eval("physproextdb\\categories()"))()
        loadstring(math.eval("physproextdb\\variables()"))()
        loadstring(math.eval("physproextdb\\subcategories()"))()
        loadstring(math.eval("physproextdb\\equations()"))()
    end)

    if err then
        print("No external DB loaded")
        -- Display something, or it simply means there is nothing to be loaded.
    else
        -- Display something that tells the user the external DB has been successfully loaded.
        print("External DB succesfully loaded")
    end
end
------------------------------
-- End of database/exdb.lua --
------------------------------

---------------------------------
-- Start of database/units.lua --
---------------------------------

local mathpi = math.pi

Units = {}

function Units.mainToSub(main, sub, n)
    local c = Units[main][sub]
    return n * c[1] + c[2]
end

function Units.subToMain(main, sub, n)
    local c = Units[main][sub]
    return (n - c[2]) / c[1]
end

--[[
Units["mainunit"]	= {}
Units["mainunit"]["subunit"] = {a, b}
meaning:
    n mainunit = n*a+b subunit
  or
    n subunit = (n-b)/a mainunit
--]]

Mt    = {}
Mt.G  = 1 / 1000000000
Mt.M  = 1 / 1000000
Mt.k  = 1 / 1000
Mt.h  = 1 / 100
Mt.da = 1 / 10
Mt.d  = 10
Mt.c  = 100
Mt.m  = 1000
Mt.u  = 1000000
Mt.n  = 1000000000
Mt.p  = 1000000000000

Ms     = {}
Ms.min = 60
Ms.hr  = 3600
Ms.day = 86400
Ms.wk  = 604800
Ms.yr  = 217728000

--Time
Units["s"]        = {}
Units["s"]["min"] = {Ms.min, 0}
Units["s"]["hr"]  = {Ms.hr, 0}
Units["s"]["day"] = {Ms.day, 0}
Units["s"]["wk"]  = {Ms.wk, 0}
Units["s"]["yr"]  = {Mt.yr, 0}

--Length
Units["m"]               = {}
Units["m"]["pm"]         = {Mt.p, 0}
Units["m"]["nm"]         = {Mt.n, 0}
Units["m"][g.mu[2].."m"] = {Mt.u, 0}
Units["m"]["mm"]         = {Mt.m, 0}
Units["m"]["cm"]         = {Mt.c, 0}
Units["m"]["dm"]         = {Mt.d, 0}
Units["m"]["km"]         = {Mt.k, 0}
Units["m"]["in"]         = {0.0254, 0}
Units["m"]["ft"]         = {0.3048, 0}
Units["m"]["yd"]         = {0.9144, 0}
Units["m"]["mi"]         = {1609.34, 0}
Units["m"]["Nmi"]        = {1852, 0}
Units["m"]["ftm"]        = {1.8288, 0}
Units["m"]["FB-F"]       = {109.7, 0}

--Area
Units[s.m2]                = {}
Units[s.m2]["nm"..s.sp2]   = {Mt.n, 0}
Units[s.m2][g.mu[2]..s.m2] = {Mt.u, 0}
Units[s.m2]["mm"..s.sp2]   = {Mt.m2, 0}
Units[s.m2]["cm"..s.sp2]   = {Mt.c, 0}
Units[s.m2]["km"..s.sp2]   = {Mt.k, 0}
Units[s.m2]["in"..s.sp2]   = {0.0254, 0}
Units[s.m2]["ft"..s.sp2]   = {0.3048, 0}
Units[s.m2]["yd"..s.sp2]   = {0.9144, 0}
Units[s.m2]["mi"..s.sp2]   = {1609.34, 0}
Units[s.m2]["Nmi"..s.sp2]  = {1852, 0}

--Volume
Units[s.m3]              = {}
Units[s.m3]["mm"..s.sp3] = {Mt.m, 0}
Units[s.m3]["cm"..s.sp3] = {Mt.c, 0}
Units[s.m3]["km"..s.sp3] = {Mt.k, 0}
Units[s.m3]["ml"]        = {0.000001, 0}
Units[s.m3]["l"]         = {0.001, 0}
Units[s.m3]["in"..s.sp3] = {0.000016387064, 0}
Units[s.m3]["ft"..s.sp3] = {0.028316846592, 0}
Units[s.m3]["yd"..s.sp3] = {0.764554857984, 0}
Units[s.m3]["tsp"]       = {0.00000492892159375, 0}
Units[s.m3]["tbsp"]      = {0.00001478676478125, 0}
Units[s.m3]["floz"]      = {0.0000295735295625, 0}
Units[s.m3]["cup"]       = {0.0002365882365, 0}
Units[s.m3]["pt"]        = {0.000473176473, 0}
Units[s.m3]["qt"]        = {0.000946352946, 0}
Units[s.m3]["gal"]       = {0.003785411784, 0}
Units[s.m3]["flozUK"]    = {0.000028413075, 0}
Units[s.m3]["galUK"]     = {0.004546092, 0}

--Velocity
Units["m/s"]           = {}
Units["m/s"]["km/s"]   = {Mt.k, 0}
Units["m/s"]["cm/s"]   = {Mt.c, 0}
Units["m/s"]["mm/s"]   = {Mt.m, 0}
Units["m/s"]["m/hr"]   = {Ms.hr, 0}
Units["m/s"]["km/hr"]  = {3.6, 0}
Units["m/s"]["knot"]   = {0.514444, 0}
Units["m/s"]["mi/hr"]  = {0.44704, 0}
Units["m/s"]["km/min"] = {16.6667, 0}
Units["m/s"]["ft/min"] = {0.00508, 0}
Units["m/s"]["ft/s"]   = {0.3048, 0}
Units["m/s"]["mi/min"] = {26.8224, 0}

--Acceleration
Units[s.ms2]                  = {}
Units[s.ms2]["km/s"..s.sp2]   = {Mt.k, 0}
Units[s.ms2]["cm/s"..s.sp2]   = {Mt.c, 0}
Units[s.ms2]["mm/s"..s.sp2]   = {Mt.m, 0}
Units[s.ms2]["m/hr"..s.sp2]   = {Ms.hr, 0}
Units[s.ms2]["km/hr"..s.sp2]  = {3.6, 0}
Units[s.ms2]["knot"..s.sp2]   = {0.514444, 0}
Units[s.ms2]["mi/hr"..s.sp2]  = {0.44704, 0}
Units[s.ms2]["km/min"..s.sp2] = {16.6667, 0}
Units[s.ms2]["ft/min"..s.sp2] = {0.00508, 0}
Units[s.ms2]["ft/s"..s.sp2]   = {0.3048, 0}
Units[s.ms2]["mi/min"..s.sp2] = {26.8224, 0}

--Mass
Units["kg"]         = {}
Units["kg"]["g"]    = {Mt.m, 0}
Units["kg"]["mg"]   = {Mt.u, 0}
Units["kg"]["lb"]   = {0.453592, 0}
Units["kg"]["oz"]   = {0.0283495, 0}
Units["kg"]["ton"]  = {907.185, 0}
Units["kg"]["slug"] = {14.5939, 0}

--Force
Units["N"]         = {}
Units["N"]["kN"]   = {Mt.k, 0}
Units["N"]["mN"]   = {Mt.m, 0}
Units["N"]["dyn"]  = {100000, 0}
Units["N"]["lbf"]  = {0.224809, 0}
Units["N"]["kgf"]  = {0.101972, 0}
Units["N"]["tonf"] = {0.000112404, 0}

--Newton*sec (Impulse/Momentum)
Units[s.ns] = {}

--Energy
Units["J"]         = {}
Units["J"]["GJ"]   = {Mt.G, 0}
Units["J"]["MJ"]   = {Mt.M, 0}
Units["J"]["kJ"]   = {Mt.k, 0}
Units["J"]["mJ"]   = {Mt.m, 0}
Units["J"]["kWh"]  = {3600000, 0}
Units["J"]["ftlb"] = {1.35582, 0}
Units["J"]["BTU"]  = {1055.06, 0}

--Power
Units["W"]       = {}
Units["W"]["GW"] = {Mt.G, 0}
Units["W"]["MW"] = {Mt.M, 0}
Units["W"]["kW"] = {Mt.k, 0}
Units["W"]["mW"] = {Mt.m, 0}
Units["W"]["hp"] = {745.7, 0}

--Pressure
Units["Pa"]                    = {}
Units["Pa"]["mPA"]             = {Mt.m, 0}
Units["Pa"]["kPa"]             = {Mt.k, 0}
Units["Pa"]["MPa"]             = {Mt.M, 0}
Units["Pa"]["mmH"..s.sb2.."O"] = {9.80665, 0}
Units["Pa"]["inH"..s.sb2.."O"] = {249.08891, 0}
Units["Pa"]["mmHg"]            = {133.32236842105, 0}
Units["Pa"]["inHg"]            = {3338.6388157895, 0}
Units["Pa"]["mbar"]            = {100, 0}
Units["Pa"]["lb/ft"..s.sp2]    = {47.880258980336, 0}
Units["Pa"]["psi"]             = {6894.7572931684, 0}
Units["Pa"]["atm"]             = {101325, 0}

--Temperature
Units["K"]            = {}
Units["K"][s.dg.."C"] = {1, 273.15}
--Units["K"][s.dg.."F"] = {0, 0}

--Moles
Units["mol"] = {}

--Molecular mass
Units["amu"]       = {}
Units["amu"]["kg"] = {0.000000000000000000000000001660538782, 0}
Units["amu"]["g"]  = {0.000000000000000000000001660538782, 0}
Units["amu"]["mg"] = {0.000000000000000000001660538782, 0}

--Heat Capacity
Units[s.jkgk]                     = {}
Units[s.jkgk]["J/kg"..s.bul.."C"] = {1, 0}
--Units["J/kg*K"]["Cal/kg*K"] = {}

--Mole Energy
Units["kJ/mol"] = {}

--Density
Units[s.kgm3] = {}

--Spring Constant
Units["N/m"] = {}

--Frequency
Units["Hz"]        = {}
Units["Hz"]["kHz"] = {Mt.k, 0}
Units["Hz"]["MHz"] = {Mt.M, 0}
Units["Hz"]["GHz"] = {Mt.G, 0}
Units["Hz"]["mHz"] = {Mt.m, 0}
Units["Hz"]["nHz"] = {Mt.n, 0}

--Degrees (Angle)
Units[s.dg]        = {}
Units[s.dg]["rad"] = {(180/mathpi), 0}

--Charge
Units["C"]               = {}
Units["C"]["mC"]         = {Mt.m, 0}
Units["C"][g.mu[2].."C"] = {Mt.u, 0}

--Voltage
Units["V"]       = {}
Units["V"]["mV"] = {Mt.m, 0}

--Current
Units["A"]               = {}
Units["A"]["mA"]         = {Mt.m, 0}
Units["A"][g.mu[2].."A"] = {Mt.u, 0}

--Rssistence
Units[g.om[1]]                   = {}
Units[g.om[1]]["k"..g.om[1]]     = {Mt.k, 0}
Units[g.om[1]]["m"..g.om[1]]     = {Mt.m, 0}
Units[g.om[1]][g.mu[2]..g.om[1]] = {Mt.u, 0}

--Resistivity
Units[s.Omm] = {}

--Teslas
Units["T"] = {}

--Decay Reate
Units["Bq"] = {}

--Amount of nuclei
Units["nuclei"] = {}
-------------------------------
-- End of database/units.lua --
-------------------------------

--------------------------------
-- End of database/dbmain.lua --
--------------------------------

--------------------------------
-- Start of lib/animation.lua --
--------------------------------

----------

local tstart = timer.start
function timer.start(ms)
    if not timer.isRunning then
        tstart(ms)
    end
    timer.isRunning = true
end

local tstop = timer.stop
function timer.stop()
    timer.isRunning = false
    tstop()
end


if platform.hw then
    timer.multiplier = platform.hw() < 4 and 3.2 or 1
else
    timer.multiplier = platform.isDeviceModeRendering() and 3.2 or 1
end

function on.timer()
    --current_screen():timer()
    local j = 1

    while j <= #timer.tasks do -- for each task
        if timer.tasks[j][2]() then -- delete it if has ended
            table.remove(timer.tasks, j)
            sj = j - 1
        end
        j = j + 1
    end
    if #timer.tasks > 0 then
        platform.window:invalidate()
    else
        --for _,screen in pairs(Screens) do
        --    screen:size()
        --end
        timer.stop()
    end
end

timer.tasks = {}

timer.addTask = function(object, task) timer.start(0.01) table.insert(timer.tasks, { object, task }) end

function timer.purgeTasks(object)
    local j = 1

    while j <= #timer.tasks do
        if timer.tasks[j][1] == object then
            table.remove(timer.tasks, j)
            j = j - 1
        end
        j = j + 1
    end
end


---------- Animable Object class
Object = class()
function Object:init(x, y, w, h, r)
    self.tasks   = {}
    self.x       = x
    self.y       = y
    self.w       = w
    self.h       = h
    self.r       = r
    self.visible = true
end

function Object:PushTask(task, t, ms, callback)
    table.insert(self.tasks, { task, t, ms, callback })
    timer.start(0.01)
    if #self.tasks == 1 then
        local ok = task(self, t, ms, callback)

        if not ok then table.remove(self.tasks, 1) end
    end
end

function Object:PopTask()
    table.remove(self.tasks, 1)
    if #self.tasks > 0 then
        local task, t, ms, callback = unpack(self.tasks[1])
        local ok = task(self, t, ms, callback)

        if not ok then table.remove(self.tasks, 1) end
    end
end

function Object:purgeTasks()
    for i = 1, #self.tasks do
        self.tasks[i] = nil
    end
    collectgarbage()
    timer.purgeTasks(self)
    self.tasks = {}
    return self
end

function Object:paint(gc)
    -- to override
end

speed = 1

function Object:__Animate(t, ms, callback)
    if not ms then ms = 50 end
    if ms < 0 then print("Error: Invalid time divisor (must be >= 0)") return end
    ms = ms / timer.multiplier
    if ms               == 0 then ms = 1 end
    if not t or type(t) ~= "table" then print("Error: Target position is " .. type(t)) return end
    if not t.x then t.x = self.x end
    if not t.y then t.y = self.y end
    if not t.w then t.w = self.w end
    if not t.h then t.h = self.h end
    if not t.r then t.r = self.r else t.r = math.pi * t.r / 180 end
    local xinc  = (t.x - self.x) / ms
    local xside = xinc >= 0 and 1 or -1
    local yinc  = (t.y - self.y) / ms
    local yside = yinc >= 0 and 1 or -1
    local winc  = (t.w - self.w) / ms
    local wside = winc >= 0 and 1 or -1
    local hinc  = (t.h - self.h) / ms
    local hside = hinc >= 0 and 1 or -1
    local rinc  = (t.r - self.r) / ms
    local rside = rinc >= 0 and 1 or -1

    timer.addTask(self, function()
        local b1, b2, b3, b4, b5 = false, false, false, false, false

        if (self.x + xinc * speed) * xside < t.x * xside then self.x = self.x + xinc * speed else b1 = true end
        if self.y * yside < t.y * yside then self.y                  = self.y + yinc * speed else b2 = true end
        if self.w * wside < t.w * wside then self.w                  = self.w + winc * speed else b3 = true end
        if self.h * hside < t.h * hside then self.h                  = self.h + hinc * speed else b4 = true end
        if self.r * rside < t.r * rside then self.r                  = self.r + rinc * speed else b5 = true end
        if self.w < 0 then self.w                                    = 0 end
        if self.h < 0 then self.h                                    = 0 end
        if b1 and b2 and b3 and b4 and b5 then
            self.x, self.y, self.w, self.h, self.r = t.x, t.y, t.w, t.h, t.r
            self:PopTask()
            if callback then callback(self) end
            return true
        end
        return false
    end)
    return true
end

function Object:__Delay(_, ms, callback)
    if not ms then ms = 50 end
    if ms < 0 then print("Error: Invalid time divisor (must be >= 0)") return end
    ms = ms / timer.multiplier
    if ms == 0 then ms = 1 end
    local t = 0

    timer.addTask(self, function()
        if t < ms then
            t = t + 1
            return false
        else
            self:PopTask()
            if callback then callback(self) end
            return true
        end
    end)
    return true
end

function Object:__setVisible(t, _, _)
    timer.addTask(self, function()
        self.visible = t
        self:PopTask()
        return true
    end)
    return true
end

function Object:Animate(t, ms, callback)
    self:PushTask(self.__Animate, t, ms, callback)
    return self
end

function Object:Delay(ms, callback)
    self:PushTask(self.__Delay, false, ms, callback)
    return self
end

function Object:setVisible(t)
    self:PushTask(self.__setVisible, t, 1, false)
    return self
end
------------------------------
-- End of lib/animation.lua --
------------------------------

------------------------------
-- Start of lib/globals.lua --
------------------------------

------------------------------------------------------------------
--                  Overall Global Variables                    --
------------------------------------------------------------------
--
-- Uses BetterLuaAPI : https://github.com/adriweb/BetterLuaAPI-for-TI-Nspire
--

a_acute     = string.uchar(225)
a_circ      = string.uchar(226)
a_tilde     = string.uchar(227)
a_diaer     = string.uchar(228)
a_ring      = string.uchar(229)
e_acute     = string.uchar(233)
e_grave     = string.uchar(232)
o_acute     = string.uchar(243)
o_circ      = string.uchar(244)
l_alpha     = string.uchar(945)
l_beta      = string.uchar(946)
l_omega     = string.uchar(2126)
sup_plus    = string.uchar(8314)
sup_minus   = string.uchar(8315)
right_arrow = string.uchar(8594)


Color = {
    ["black"]      = {0, 0, 0},
    ["red"]        = {255, 0, 0},
    ["green"]      = {0, 255, 0},
    ["blue "]      = {0, 0, 255},
    ["white"]      = {255, 255, 255},
    ["brown"]      = {165,42,42},
    ["cyan"]       = {0,255,255},
    ["darkblue"]   = {0,0,139},
    ["darkred"]    = {139,0,0},
    ["fuchsia"]    = {255,0,255},
    ["gold"]       = {255,215,0},
    ["gray"]       = {127,127,127},
    ["grey"]       = {127,127,127},
    ["lightblue"]  = {173,216,230},
    ["lightgreen"] = {144,238,144},
    ["magenta"]    = {255,0,255},
    ["maroon"]     = {128,0,0},
    ["navyblue"]   = {159,175,223},
    ["orange"]     = {255,165,0},
    ["palegreen"]  = {152,251,152},
    ["pink"]       = {255,192,203},
    ["purple"]     = {128,0,128},
    ["royalblue"]  = {65,105,225},
    ["salmon"]     = {250,128,114},
    ["seagreen"]   = {46,139,87},
    ["silver"]     = {192,192,192},
    ["turquoise"]  = {64,224,208},
    ["violet"]     = {238,130,238},
    ["yellow"]     = {255,255,0}
}
Color.mt = {__index = function () return {0,0,0} end}
setmetatable(Color,Color.mt)

function copyTable(t)
  local t2 = {}
  for k,v in pairs(t) do
    t2[k] = v
  end
  return t2
end

function deepcopy(t) -- This function recursively copies a table's contents, and ensures that metatables are preserved. That is, it will correctly clone a pure Lua object.
    if type(t) ~= 'table' then return t end
    local mt  = getmetatable(t)
    local res = {}
    for k,v in pairs(t) do
        if type(v) == 'table' then
        v = deepcopy(v)
        end
    res[k] = v
    end
    setmetatable(res,mt)
    return res
end -- from http://snippets.luacode.org/snippets/Deep_copy_of_a_Lua_Table_2

function utf8(nbr)
    return string.uchar(nbr)
end

function test(arg)
    return arg and 1 or 0
end

function screenRefresh()
    return platform.window:invalidate()
end

function pww()
    return platform.window:width()
end

function pwh()
    return platform.window:height()
end

function drawPoint(gc, x, y)
    gc:fillRect(x, y, 1, 1)
end

function drawCircle(gc, x, y, diameter)
    gc:drawArc(x - diameter/2, y - diameter/2, diameter,diameter,0,360)
end

function drawCenteredString(gc, str)
    gc:drawString(str, .5*(pww() - gc:getStringWidth(str)), .5*pwh(), "middle")
end

function drawXCenteredString(gc, str, y)
    gc:drawString(str, .5*(pww() - gc:getStringWidth(str)), y, "top")
end

function setColor(gc,theColor)
    if type(theColor) == "string" then
        theColor = string.lower(theColor)
        if type(Color[theColor]) == "table" then gc:setColorRGB(unpack(Color[theColor])) end
    elseif type(theColor) == "table" then
        gc:setColorRGB(unpack(theColor))
    end
end

function verticalBar(gc,x)
    gc:fillRect(gc,x,0,1,pwh())
end

function horizontalBar(gc,y)
    gc:fillRect(gc,0,y,pww(),1)
end

function nativeBar(gc, screen, y)
    gc:setColorRGB(128,128,128)
    gc:fillRect(screen.x+5, screen.y+y, screen.w-10, 2)
end

function drawSquare(gc,x,y,l)
    gc:drawPolyLine(gc,{(x-l/2),(y-l/2), (x+l/2),(y-l/2), (x+l/2),(y+l/2), (x-l/2),(y+l/2), (x-l/2),(y-l/2)})
end

function drawRoundRect(gc,x,y,wd,ht,rd)  -- wd = width, ht = height, rd = radius of the rounded corner
    x = x-wd/2  -- let the center of the square be the origin (x coord)
    y = y-ht/2 -- same for y coord
    if rd > ht/2 then rd = ht/2 end -- avoid drawing cool but unexpected shapes. This will draw a circle (max rd)
    gc:drawLine(x + rd, y, x + wd - (rd), y);
    gc:drawArc(x + wd - (rd*2), y + ht - (rd*2), rd*2, rd*2, 270, 90);
    gc:drawLine(x + wd, y + rd, x + wd, y + ht - (rd));
    gc:drawArc(x + wd - (rd*2), y, rd*2, rd*2,0,90);
    gc:drawLine(x + wd - (rd), y + ht, x + rd, y + ht);
    gc:drawArc(x, y, rd*2, rd*2, 90, 90);
    gc:drawLine(x, y + ht - (rd), x, y + rd);
    gc:drawArc(x, y + ht - (rd*2), rd*2, rd*2, 180, 90);
end

function fillRoundRect(gc,x,y,wd,ht,radius)  -- wd = width and ht = height -- renders badly when transparency (alpha) is not at maximum >< will re-code later
    if radius > ht/2 then radius = ht/2 end -- avoid drawing cool but unexpected shapes. This will draw a circle (max radius)
    gc:fillPolygon({(x-wd/2),(y-ht/2+radius), (x+wd/2),(y-ht/2+radius), (x+wd/2),(y+ht/2-radius), (x-wd/2),(y+ht/2-radius), (x-wd/2),(y-ht/2+radius)})
    gc:fillPolygon({(x-wd/2-radius+1),(y-ht/2), (x+wd/2-radius+1),(y-ht/2), (x+wd/2-radius+1),(y+ht/2), (x-wd/2+radius),(y+ht/2), (x-wd/2+radius),(y-ht/2)})
    x = x-wd/2  -- let the center of the square be the origin (x coord)
    y = y-ht/2 -- same
    gc:fillArc(x + wd - (radius*2), y + ht - (radius*2), radius*2, radius*2, 1, -91);
    gc:fillArc(x + wd - (radius*2), y, radius*2, radius*2,-2,91);
    gc:fillArc(x, y, radius*2, radius*2, 85, 95);
    gc:fillArc(x, y + ht - (radius*2), radius*2, radius*2, 180, 95);
end


-- Fullscreen 'Library'

doNotDisplayIcon = true

icon=image.new("\020\0\0\0\020\0\0\0\0\0\0\0\040\0\0\0\016\0\001\000wwwwwwwwwwwwww\223\251\222\251\189\251\188\251\188\251\221\255\221\255\254\255wwwwwwwwwwwwwwwwwwww\156\243\024\227\215\218\214\218\247\222\025\227Z\235\156\243wwwwwwwwwwwwwwwwwwwwww\024\227S\202s\206\181\214\214\218\248\2229\2279\231Z\235Z\235wwwwwwwwwwwwwwwwwwZ\235\207\185\016\194R\202s\206\148\210\214\218\214\218\214\2229\231Z\235:\231wwwwwwwwwwwwww\190\251\239\189\239\189\148\210\148\210\156\247\148\214\214\218\147\210\181\218{\239\025\227Z\235|\239wwwwwwwwwwww\149\214\239\189\239\189\239\189\206\185{\239\206\185R\202R\202\148\214{\239\247\2229\227Z\231wwwwwwwwww\189\255\016\194\239\189\239\189\239\189\206\185{\239\173\181\016\194\016\194s\210Z\235\214\218\247\222\025\227\189\247wwwwwwww8\243\016\194\239\189\239\189\240\189\206\189{\239\206\185\016\194\207\185s\2109\235\148\210\214\218\024\223{\239wwwwww\254\255\244\238\239\189\206\185\207\185\206\185\140\177z\239\008\161\008\161\198\152\016\194\214\218\173\181\017\194t\206:\231wwwwww\188\2556\247\016\194\206\185k\173)\165\231\156{\239\132\144\133\144c\140\239\193\148\210\008\161l\173\239\1899\231wwwwwwx\255\154\255\240\189\231\156\132\144C\136B\136k\173\0\128B\136!\132\165\148\231\156B\136\165\148K\173\156\243wwwwww6\255\154\255\024\227\198\152c\140\206\185\206\185\173\181\207\185k\173)\165\206\185\239\189J\169c\140\173\181\222\251wwwwww6\255x\255ww\140\177\0\128\148\210\016\194\173\181R\202\173\181\206\185R\202\239\189\231\156\164\152\213\218wwwwwwwwx\2556\255ww\222\251J\169\008\161c\140c\140c\140c\140c\140c\140\008\169O\230o\234\178\242z\251wwwwww\221\255\209\250wwwwww\239\189\132\144d\140B\136d\140\132\144B\136\202\213\012\234\012\230\012\230-\234\189\251wwwwww\242\2506\255wwwwww\156\243\149\210\016\194\240\1892\202\247\222\236\221\147\222r\2220\214\146\222\245\238wwwwww\188\255\141\250\243\250wwwwwwwwwwwwww\021\251\168\221\136\217\169\213\236\213O\222Y\243wwwwwwww\188\255\142\250m\250\244\250X\255y\2557\255\177\250)\246(\246K\242\168\229\134\229\134\229\178\238wwwwwwwwwwwwwwW\255\175\250k\250J\250K\250\141\250\242\250y\255ww\188\2557\251z\251wwwwwwwwwwwwwwwwwwww\222\255\222\255\222\255wwwwwwwwwwwwwwwwwwwwww")

local pw    = getmetatable(platform.window)
function pw:invalidateAll()
    if self.setFocus then
        self:setFocus(false)
        self:setFocus(true)
    end
end

function on.draw(gc)
    gc:setColorRGB(255, 255, 255)
    gc:fillRect(18, 5, 20, 20)
    gc:drawImage(icon, 18, 5)
end

if not platform.withGC then
    function platform.withGC(func, ...)
        local gc = platform.gc()
        gc:begin()
        func(..., gc)
        gc:finish()
    end
end

----------------------------
-- End of lib/globals.lua --
----------------------------

-----------------------------
-- Start of lib/screen.lua --
-----------------------------

stdout = print

function pprint(...)
        stdout(...)
        local out = ""

        for _,v in ipairs({...}) do
                out = out .. (_==1 and "" or "    ") .. tostring(v)
        end
        var.store("print", out)
end


function Pr(n, d, s, ex)
        local nc = tonumber(n)

        if nc and nc<math.abs(nc) then
                return s-ex-(type(n)== "number" and math.abs(n) or (.01*s*math.abs(nc)))
        else
                return (type(n)=="number" and n or (type(n)=="string" and .01*s*nc or d))
        end
end

-- Apply an extension on a class, and return our new frankenstein
function addExtension(oldclass, extension)
        local newclass = class(oldclass)

        for key, data in pairs(extension) do
                newclass[key] = data
        end
        return newclass
end

clipRectData = {}

function gc_clipRect(gc, what, x, y, w, h)
        if what == "set" and clipRectData.current then
                clipRectData.old = clipRectData.current

        elseif what == "subset" and clipRectData.current then
                clipRectData.old = clipRectData.current

                x    = clipRectData.old.x<x and x or clipRectData.old.x
                y    = clipRectData.old.y<y and y or clipRectData.old.y
                h    = clipRectData.old.y+clipRectData.old.h > y+h and h or clipRectData.old.y+clipRectData.old.h-y
                w    = clipRectData.old.x+clipRectData.old.w > x+w and w or clipRectData.old.x+clipRectData.old.w-x
                what = "set"

        elseif what == "restore" and clipRectData.old then
                --gc:clipRect("reset")
                what = "set"
                x    = clipRectData.old.x
                y    = clipRectData.old.y
                h    = clipRectData.old.h
                w    = clipRectData.old.w
        elseif what == "restore" then
                what = "reset"
        end

        gc:clipRect(what, x, y, w, h)
        if x and y and w and h then clipRectData.current = {x=x,y=y,w=w,h=h} end
end

------------------------------------------------------------------
--                        Screen  Class                         --
------------------------------------------------------------------

Screen = class(Object)

Screens = {}

function scrollScreen(screen, d, callback)
  --  print("scrollScreen.  number of screens : ", #Screens)
    local dir = d or 1

    screen.x=dir*kXSize
    screen:Animate( {x=0}, 10, callback )
end

function insertScreen(screen, ...)
  --  print("insertScreen")
        screen:size()
    if current_screen() ~= DummyScreen then
        current_screen():screenLoseFocus()
        local coeff = pushFromBack and 1 or -1
            current_screen():Animate( {x=coeff*kXSize}, 10)
    end
        table.insert(Screens, screen)

        platform.window:invalidate()
        current_screen():pushed(...)
end

function insertScreen_direct(screen, ...)
  --  print("insertScreen_direct")
        screen:size()
        table.insert(Screens, screen)
        platform.window:invalidate()
        current_screen():pushed(...)
end

function push_screen(screen, ...)
    --print("push_screen")
    local args      = ...
    local theScreen = current_screen()

    pushFromBack = false
    insertScreen(screen, ...)
    scrollScreen(screen, 1, function() remove_screen_previous(theScreen) end)
end

function push_screen_back(screen, ...)
    --print("push_screen_back")
    local theScreen = current_screen()

    pushFromBack = true
    insertScreen(screen, ...)
    scrollScreen(screen, -1, function() remove_screen_previous(theScreen) end)
end

function push_screen_direct(screen, ...)
   -- print("push_screen_direct")
        table.insert(Screens, screen)
        platform.window:invalidate()
        current_screen():pushed(...)
end

function only_screen(screen, ...)
   -- print("only_screen")
    remove_screen(current_screen())
        Screens = {}
        push_screen(screen, ...)
        platform.window:invalidate()
end

function only_screen_back(screen, ...)
 --   print("only_screen_back")
    --Screens = {}
        push_screen_back(screen, ...)
        platform.window:invalidate()
end

function remove_screen_previous(...)
  --  print("remove_screen_previous")
        platform.window:invalidate()
        current_screen():removed(...)
        res=table.remove(Screens, #Screens-1)
        current_screen():screenGetFocus()
        return res
end

function remove_screen(...)
  --  print("remove_screen")
        platform.window:invalidate()
        current_screen():removed(...)
        res=table.remove(Screens)
        current_screen():screenGetFocus()
        return res
end

function current_screen()
        return Screens[#Screens] or DummyScreen
end

function Screen:init(xx,yy,ww,hh)

        self.yy = yy
        self.xx = xx
        self.hh = hh
        self.ww = ww

        self:ext()
        self:size(0)

        Object.init(self, self.x, self.y, self.w, self.h, 0)
end

function Screen:ext()
end

function Screen:size()
        local screenH = platform.window:height()
        local screenW =  platform.window:width()

        if screenH == 0 then screenH=212 end
        if screenW == 0 then screenW=318 end

        self.x        =        math.floor(Pr(self.xx, 0, screenW)+.5)
        self.y        =        math.floor(Pr(self.yy, 0, screenH)+.5)
        self.w        =        math.floor(Pr(self.ww, screenW, screenW, 0)+.5)
        self.h        =        math.floor(Pr(self.hh, screenH, screenH, 0)+.5)
end


function Screen:pushed() end
function Screen:removed() end
function Screen:screenLoseFocus() end
function Screen:screenGetFocus() end

function Screen:draw(gc)
        --self:size()
        self:paint(gc)
end

function Screen:paint(gc) end

function Screen:invalidate()
        platform.window:invalidate(self.x ,self.y , self.w, self.h)
end

function Screen:arrowKey() end
function Screen:enterKey() end
function Screen:backspaceKey() end
function Screen:clearKey() end
function Screen:escapeKey() end
function Screen:tabKey() end
function Screen:backtabKey() end
function Screen:charIn(char) end

function Screen:mouseDown() end
function Screen:mouseUp() end
function Screen:mouseMove() end
function Screen:contextMenu() end

function Screen:appended() end

function Screen:resize(w,h) end

function Screen:destroy()
        self = nil
end

------------------------------------------------------------------
--                   WidgetManager Extension                    --
------------------------------------------------------------------

WidgetManager = {}

function WidgetManager:ext()
        self.widgets =        {}
        self.focus   =        0
end

function WidgetManager:resize(w,h)
    if self.x then  --already inited
        self:size()
    end
end

function WidgetManager:appendWidget(widget, xx, yy)
        widget.xx     = xx
        widget.yy     = yy
        widget.parent = self
        widget:size()

        table.insert(self.widgets, widget)
        widget.pid = #self.widgets

        widget:appended(self)
        return self
end

function WidgetManager:getWidget()
        return self.widgets[self.focus]
end

function WidgetManager:drawWidgets(gc)
        for _, widget in pairs(self.widgets) do
                widget:size()
                widget:draw(gc)

                gc:setColorRGB(0,0,0)
        end
end

function WidgetManager:postPaint(gc)
end

function WidgetManager:draw(gc)
        --self:size()
        self:paint(gc)
        self:drawWidgets(gc)
        self:postPaint(gc)
end


function WidgetManager:loop(n) end

function WidgetManager:stealFocus(n)
        local oldfocus=self.focus
        if oldfocus~=0 then
                local veto = self:getWidget():loseFocus(n)
                if veto == -1 then
                        return -1, oldfocus
                end
                self:getWidget().hasFocus = false
                self.focus                = 0
        end
        return 0, oldfocus
end

function WidgetManager:focusChange() end

function WidgetManager:switchFocus(n, b)
    if n~=0 and #self.widgets>0 then
        local veto, focus = self:stealFocus(n)

        if veto == -1 then
            return -1
        end

        local looped

        self.focus = focus + n
        if self.focus>#self.widgets then
            self.focus = 1
            looped     = true
        elseif self.focus<1 then
            self.focus = #self.widgets
            looped     = true
        end
        if looped and self.noloop and not b then
            self.focus = focus
            self:loop(n)
        else
            self:getWidget().hasFocus = true
            self:getWidget():getFocus(n)
        end
    end
    self:focusChange()
end


function WidgetManager:arrowKey(arrow)
    if self.focus~=0 then
        self:getWidget():arrowKey(arrow)
    end
    self:invalidate()
end

function WidgetManager:enterKey()
    if self.focus~=0 then
        self:getWidget():enterKey()
    else
        if self.widgets and self.widgets[1] then   -- ugh, quite a bad hack for the mouseUp at (0,0) when cursor isn't shown (grrr TI) :/
            self.widgets[1]:enterKey()
        end
    end
    self:invalidate()
end

function WidgetManager:clearKey()
    if self.focus~=0 then
        self:getWidget():clearKey()
    end
    self:invalidate()
end

function WidgetManager:backspaceKey()
    if self.focus~=0 then
        self:getWidget():backspaceKey()
    end
    self:invalidate()
end

function WidgetManager:escapeKey()
    if self.focus~=0 then
        self:getWidget():escapeKey()
    end
    self:invalidate()
end

function WidgetManager:tabKey()
    self:switchFocus(1)
    self:invalidate()
end

function WidgetManager:backtabKey()
    self:switchFocus(-1)
    self:invalidate()
end

function WidgetManager:charIn(char)
    if self.focus~=0 then
        self:getWidget():charIn(char)
    end
    self:invalidate()
end

function WidgetManager:getWidgetIn(x, y)
    for n, widget in pairs(self.widgets) do
        local wox = widget.ox or 0
        local woy = widget.oy or 0

        if x>=widget.x-wox and y>=widget.y-wox and x<widget.x+widget.w-wox and y<widget.y+widget.h-woy then
            return n, widget
        end
    end
end

function WidgetManager:mouseDown(x, y)
    local n, widget = self:getWidgetIn(x, y)

    if n then
        if self.focus~=0 and self.focus~=n then self:getWidget().hasFocus = false self:getWidget():loseFocus()  end
        self.focus = n

        widget.hasFocus = true
        widget:getFocus()

        widget:mouseDown(x, y)
        self:focusChange()
    else
        if self.focus~=0 then
        self:getWidget().hasFocus = false
        self:getWidget():loseFocus() end
        self.focus = 0
        end
end

function WidgetManager:mouseUp(x, y)
    if self.focus~=0 then
        --self:getWidget():mouseUp(x, y)
    end
    for _, widget in pairs(self.widgets) do
        widget:mouseUp(x,y) -- well, mouseUp is a release of a button, so everything previously "clicked" should be released, for every widget, even if the mouse has moved (and thus changed widget)
        -- eventually, a better way for this would be to keep track of the last widget active and do it to this one only...
    end
    self:invalidate()
end

function WidgetManager:mouseMove(x, y)
    if self.focus~=0 then
        self:getWidget():mouseMove(x, y)
    end
end

--------------------------
-- Our new frankenstein --
--------------------------

WScreen        = addExtension(Screen, WidgetManager)

--Dialog screen

Dialog = class(WScreen)

function Dialog:init(title,xx,yy,ww,hh)

    self.yy    = yy
    self.xx    = xx
    self.hh    = hh
    self.ww    = ww
    self.title = title
    self:size()

    self.widgets = {}
    self.focus   = 0

end

function Dialog:paint(gc)
    self.xx        = (pww()-self.w)/2
    self.yy        = (pwh()-self.h)/2
    self.x, self.y = self.xx, self.yy

    gc:setFont("sansserif","r",10)
    gc:setColorRGB(224,224,224)
    gc:fillRect(self.x, self.y, self.w, self.h)

    for i=1, 14,2 do
        gc:setColorRGB(32+i*3, 32+i*4, 32+i*3)
        gc:fillRect(self.x, self.y+i, self.w,2)
    end
    gc:setColorRGB(32+16*3, 32+16*4, 32+16*3)
    gc:fillRect(self.x, self.y+15, self.w, 10)

    gc:setColorRGB(128,128,128)
    gc:drawRect(self.x, self.y, self.w, self.h)
    gc:drawRect(self.x-1, self.y-1, self.w+2, self.h+2)

    gc:setColorRGB(96,100,96)
    gc:fillRect(self.x+self.w+1, self.y, 1, self.h+2)
    gc:fillRect(self.x, self.y+self.h+2, self.w+3, 1)

    gc:setColorRGB(104,108,104)
    gc:fillRect(self.x+self.w+2, self.y+1, 1, self.h+2)
    gc:fillRect(self.x+1, self.y+self.h+3, self.w+3, 1)
    gc:fillRect(self.x+self.w+3, self.y+2, 1, self.h+2)
    gc:fillRect(self.x+2, self.y+self.h+4, self.w+2, 1)

    gc:setColorRGB(255,255,255)
    gc:drawString(self.title, self.x + 4, self.y+2, "top")

    self:postPaint(gc)
end

function Dialog:postPaint() end



---
-- The dummy screen
---

DummyScreen = Screen()


------------------------------------------------------------------
--                   Bindings to the on events                  --
------------------------------------------------------------------


function on.paint(gc)
    allWentWell, generalErrMsg = pcall(onpaint, gc)
    if not allWentWell and errorHandler then
        errorHandler.display      = true
        errorHandler.errorMessage = generalErrMsg
    end
    if platform.hw and platform.hw() < 4 and not doNotDisplayIcon then
        platform.withGC(on.draw)
    end
end

function onpaint(gc)
    for _, screen in pairs(Screens) do
        screen:draw(gc)
    end
    if errorHandler.display then
        errorPopup(gc)
    end
end

function on.resize(w, h)
    -- Global Ratio Constants for On-Calc (shouldn't be used often though...)
    kXRatio = w/320
    kYRatio = h/212

    kXSize, kYSize = w, h

    for _,screen in pairs(Screens) do
        screen:resize(w,h)
    end
end

function on.arrowKey(arrw) current_screen():arrowKey(arrw) end
function on.enterKey() current_screen():enterKey() end
function on.escapeKey() current_screen():escapeKey() end
function on.tabKey() current_screen():tabKey() end
function on.backtabKey() current_screen():backtabKey() end
function on.charIn(ch) current_screen():charIn(ch) end
function on.backspaceKey() current_screen():backspaceKey() end
function on.contextMenu() current_screen():contextMenu() end
function on.mouseDown(x,y) current_screen():mouseDown(x,y) end
function on.mouseUp(x,y)
    if (x == 0 and y == 0) then
        current_screen():enterKey()
    else
        current_screen():mouseUp(x,y)
    end
end
function on.mouseMove(x,y) current_screen():mouseMove(x,y) end
function on.clearKey() current_screen():clearKey() end
---------------------------
-- End of lib/screen.lua --
---------------------------

------------------------------
-- Start of lib/widgets.lua --
------------------------------

function uCol(col)
    return col[1] or 0, col[2] or 0, col[3] or 0
end

function textLim(gc, text, max)
    local ttext, out = "",""
    local width      = gc:getStringWidth(text)
    if width<max then
        return text, width
    else
        for i=1, #text do
            ttext = text:usub(1, i)
            if gc:getStringWidth(ttext.."..")>max then
                break
            end
            out = ttext
        end
        return out.."..", gc:getStringWidth(out.."..")
    end
end


------------------------------------------------------------------
--                        Widget  Class                         --
------------------------------------------------------------------

Widget = class(Screen)

function Widget:init()
    self.dw = 10
    self.dh = 10

    self:ext()
end

function Widget:setSize(w, h)
    self.ww = w or self.ww
    self.hh = h or self.hh
end

function Widget:setPos(x, y)
    self.xx = x or self.xx
    self.yy = y or self.yy
end

function Widget:size(n)
    if n then return end
    self.w = math.floor(Pr(self.ww, self.dw, self.parent.w, 0)+.5)
    self.h = math.floor(Pr(self.hh, self.dh, self.parent.h, 0)+.5)

    self.rx = math.floor(Pr(self.xx, 0, self.parent.w, self.w)+.5)
    self.ry = math.floor(Pr(self.yy, 0, self.parent.h, self.h)+.5)
    self.x  = self.parent.x + self.rx
    self.y  = self.parent.y + self.ry
end

function Widget:giveFocus()
    if self.parent.focus ~=0 then
        local veto = self.parent:stealFocus()
        if veto == -1 then
            return -1
        end
    end

    self.hasFocus     = true
    self.parent.focus = self.pid
    self:getFocus()
end

function Widget:getFocus() end
function Widget:loseFocus() end
function Widget:clearKey() end

function Widget:enterKey()
    self.parent:switchFocus(1)
end
function Widget:arrowKey(arrow)
    if arrow == "up" then
        self.parent:switchFocus(self.focusUp or -1)
    elseif arrow == "down"  then
        self.parent:switchFocus(self.focusDown or 1)
    elseif arrow == "left" then
        self.parent:switchFocus(self.focusLeft or -1)
    elseif arrow == "right"  then
        self.parent:switchFocus(self.focusRight or 1)
    end
end


WWidget = addExtension(Widget, WidgetManager)


------------------------------------------------------------------
--                        Sample Widget                         --
------------------------------------------------------------------

-- First, create a new class based on Widget
box = class(Widget)

-- Init. You should define self.dh and self.dw, in case the user doesn't supply correct width/height values.
-- self.ww and self.hh can be a number or a string. If it's a number, the width will be that amount of pixels.
-- If it's a string, it will be interpreted as % of the parent screen size.
-- These values will be used to calculate self.w and self.h (don't write to this, it will overwritten everytime the widget get's painted)
-- self.xx and self.yy will be set when appending the widget to a screen. This value support the same % method (in a string)
-- They will be used to calculate self.x and self.h
function box:init(ww,hh,t)
    self.dh = 10
    self.dw = 10
    self.ww = ww
    self.hh = hh
    self.t  = t
end

-- Paint. Here you can paint your widget stuff
-- Variable you can use:
-- self.x, self.y    : numbers, x and y coordinates of the widget relative to screen. So it's the actual pixel position on the screen.
-- self.w, self.h    : numbers, w and h of widget
-- many others

function box:paint(gc)
    gc:setColorRGB(0,0,0)

    -- Do I have focus?
    if self.hasFocus then
        -- Yes, draw a filled black square
        gc:fillRect(self.x, self.y, self.w, self.h)
    else
        -- No, draw only the outline
        gc:drawRect(self.x, self.y, self.w, self.h)
    end

    gc:setColorRGB(128,128,128)
    if self.t then
        gc:drawString(self.t,self.x+2,self.y+2,"top")
    end
end


------------------------------------------------------------------
--                         Input Widget                         --
------------------------------------------------------------------


sInput    =    class(Widget)

function sInput:init()
    self.dw = 100
    self.dh = 20

    self.value         = ""
    self.bgcolor       = {255,255,255}
    self.disabledcolor = {128,128,128}
    self.font          = {"sansserif", "r", 10}
    self.disabled      = false
end

function sInput:paint(gc)
    self.gc = gc
    local x = self.x
    local y = self.y

    gc:setFont(uCol(self.font))
    gc:setColorRGB(uCol(self.bgcolor))
    gc:fillRect(x, y, self.w, self.h)

    gc:setColorRGB(0,0,0)
    gc:drawRect(x, y, self.w, self.h)

    if self.hasFocus then
        gc:setColorRGB(40, 148, 184)
        gc:drawRect(x-1, y-1, self.w+2, self.h+2)
        gc:setColorRGB(0, 0, 0)
    end

    local text = self.value
    local p    = 0


    gc_clipRect(gc, "subset", x, y, self.w, self.h)

    --[[
    while true do
        if p==#self.value then break end
        p    =    p + 1
        text    =    self.value:sub(-p, -p) .. text
        if gc:getStringWidth(text) > (self.w - 8) then
            text    =    text:sub(2,-1)
            break
        end
    end
    --]]

    if self.disabled or self.value == "" then
        gc:setColorRGB(uCol(self.disabledcolor))
    end
    if self.value == ""  then
        text = self.placeholder or ""
    end

    local strwidth = gc:getStringWidth(text)

    if strwidth<self.w-4 or not self.hasFocus then
        gc:drawString(text, x+2, y+1, "top")
    else
        gc:drawString(text, x-4+self.w-strwidth, y+1, "top")
    end

    if self.hasFocus and self.value ~= "" then
        gc:fillRect(self.x+(text==self.value and strwidth+2 or self.w-4), self.y, 1, self.h)
    end

    gc_clipRect(gc, "restore")
end

function sInput:charIn(char)
    if self.disabled or (self.number and not tonumber(self.value .. char)) then --or char~="," then
        return
    end
    --char = (char == ",") and "." or char
    self.value = self.value .. char
end

function sInput:clearKey()
    if self:deleteInvalid() then return 0 end
    self.value = ""
end

function sInput:backspaceKey()
    if self:deleteInvalid() then return 0 end
    if not self.disabled then
        self.value = self.value:usub(1,-2)
    end
end

function sInput:deleteInvalid()
    local isInvalid = string.find(self.value, "Invalid input")
    if isInvalid then
        self.value = self.value:usub(1, -19)
        return true
    end
    return false
end

function sInput:enable()
    self.disabled = false
end

function sInput:disable()
    self.disabled = true
end




------------------------------------------------------------------
--                         Label Widget                         --
------------------------------------------------------------------

sLabel = class(Widget)

function sLabel:init(text, widget)
    self.widget = widget
    self.text   = text
    self.ww     = 30

    self.hh    = 20
    self.lim   = false
    self.color = {0,0,0}
    self.font  = {"sansserif", "r", 10}
    self.p     = "top"

end

function sLabel:paint(gc)
    gc:setFont(uCol(self.font))
    gc:setColorRGB(uCol(self.color))

    local text = ""
    local ttext
    if self.lim then
        text, self.dw = textLim(gc, self.text, self.w)
    else
        text = self.text
    end

    gc:drawString(text, self.x, self.y, self.p)
end

function sLabel:getFocus(n)
    if n then
        n = n < 0 and -1 or (n > 0 and 1 or 0)
    end

    if self.widget and not n then
        self.widget:giveFocus()
    elseif n then
        self.parent:switchFocus(n)
    end
end


------------------------------------------------------------------
--                        Button Widget                         --
------------------------------------------------------------------

sButton = class(Widget)

function sButton:init(text, action)
    self.text   =  text
    self.action =  action
    self.pushed = false

    self.dh = 27
    self.dw = 48

    self.bordercolor = {136,136,136}
    self.font        = {"sansserif", "r", 10}
end

function sButton:paint(gc)
    gc:setFont(uCol(self.font))
    self.ww = gc:getStringWidth(self.text)+8
    self:size()

    if self.pushed and self.forcePushed then
        self.y = self.y + 2
    end

    gc:setColorRGB(248,252,248)
    gc:fillRect(self.x+2, self.y+2, self.w-4, self.h-4)
    gc:setColorRGB(0,0,0)

    gc:drawString(self.text, self.x+4, self.y+4, "top")

    if self.hasFocus then
        gc:setColorRGB(40, 148, 184)
        gc:setPen("medium", "smooth")
    else
        gc:setColorRGB(uCol(self.bordercolor))
        gc:setPen("thin", "smooth")
    end
    gc:fillRect(self.x + 2, self.y, self.w-4, 2)
    gc:fillRect(self.x + 2, self.y+self.h-2, self.w-4, 2)
    gc:fillRect(self.x, self.y+2, 1, self.h-4)
    gc:fillRect(self.x+1, self.y+1, 1, self.h-2)
    gc:fillRect(self.x+self.w-1, self.y+2, 1, self.h-4)
    gc:fillRect(self.x+self.w-2, self.y+1, 1, self.h-2)

    if self.hasFocus then
        gc:setColorRGB(40, 148, 184)
        -- old way of indicating focus :
        --gc:drawRect(self.x-2, self.y-2, self.w+3, self.h+3)
        --gc:drawRect(self.x-3, self.y-3, self.w+5, self.h+5)
    end
end

function sButton:mouseMove(x,y)
    local isIn = (x>self.x and x<(self.x+self.w) and y>self.y and y<(self.y+self.h))
    self.pushed = self.forcePushed and isIn
    platform.window:invalidate()
end

function sButton:enterKey()
    if self.action then self.action() end
end

function sButton:mouseDown(x,y)
    if (x>self.x and x<(self.x+self.w) and y>self.y and y<(self.y+self.h)) then
        self.pushed      = true
        self.forcePushed = true
    end
    platform.window:invalidate()
end

function sButton:mouseUp(x,y)
    self.pushed      = false
    self.forcePushed = false
    if (x>self.x and x<(self.x+self.w) and y>self.y and y<(self.y+self.h)) then
        self:enterKey()
    end
    platform.window:invalidate()
end


------------------------------------------------------------------
--                      Scrollbar Widget                        --
------------------------------------------------------------------


scrollBar = class(Widget)

scrollBar.upButton=image.new("\011\0\0\0\010\0\0\0\0\0\0\0\022\0\0\0\016\0\001\0001\1981\1981\1981\1981\1981\1981\1981\1981\1981\1981\1981\198\255\255\255\255\255\255\255\255\156\243\255\255\255\255\255\255\255\2551\1981\198\255\255\255\255\255\255\214\218\0\128\214\218\255\255\255\255\255\2551\1981\198\255\255\255\255\247\222B\136\0\128B\136\247\222\255\255\255\2551\1981\198\255\255\247\222B\136!\132\0\128!\132B\136\247\222\255\2551\1981\198\247\222B\136!\132B\136R\202B\136!\132B\136\247\2221\1981\198\132\144B\136B\136\247\222\255\255\247\222B\136B\136\132\1441\1981\198\156\243\132\144\247\222\255\255\255\255\255\255\247\222\132\144\189\2471\1981\198\255\255\222\251\255\255\255\255\255\255\255\255\255\255\222\251\255\2551\1981\1981\1981\1981\1981\1981\1981\1981\1981\1981\1981\198")
scrollBar.downButton=image.new("\011\0\0\0\010\0\0\0\0\0\0\0\022\0\0\0\016\0\001\0001\1981\1981\1981\1981\1981\1981\1981\1981\1981\1981\1981\198\255\255\222\251\255\255\255\255\255\255\255\255\255\255\222\251\255\2551\1981\198\156\243\132\144\247\222\255\255\255\255\255\255\247\222\132\144\189\2471\1981\198\132\144B\136B\136\247\222\255\255\247\222B\136B\136\132\1441\1981\198\247\222B\136!\132B\136R\202B\136!\132B\136\247\2221\1981\198\255\255\247\222B\136!\132\0\128!\132B\136\247\222\255\2551\1981\198\255\255\255\255\247\222B\136\0\128B\136\247\222\255\255\255\2551\1981\198\255\255\255\255\255\255\214\218\0\128\214\218\255\255\255\255\255\2551\1981\198\255\255\255\255\255\255\255\255\156\243\255\255\255\255\255\255\255\2551\1981\1981\1981\1981\1981\1981\1981\1981\1981\1981\1981\198")

function scrollBar:init(h, top, visible, total)
    self.color1    = {96, 100, 96}
    self.color2    = {184, 184, 184}

    self.hh = h or 100
    self.ww = 14

    self.visible = visible or 10
    self.total   = total   or 15
    self.top     = top     or 4
end

function scrollBar:paint(gc)
    gc:setColorRGB(255,255,255)
    gc:fillRect(self.x+1, self.y+1, self.w-1, self.h-1)

    gc:drawImage(self.upButton  , self.x+2, self.y+2)
    gc:drawImage(self.downButton, self.x+2, self.y+self.h-11)
    gc:setColorRGB(uCol(self.color1))
    if self.h > 28 then
        gc:drawRect(self.x + 3, self.y + 14, 8, self.h - 28)
    end

    if self.visible<self.total then
        local step = (self.h-26)/self.total
        gc:fillRect(self.x + 3, self.y + 14  + step*self.top, 9, step*self.visible)
        gc:setColorRGB(uCol(self.color2))
        gc:fillRect(self.x + 2 , self.y + 14 + step*self.top, 1, step*self.visible)
        gc:fillRect(self.x + 12, self.y + 14 + step*self.top, 1, step*self.visible)
    end
end

function scrollBar:update(top, visible, total)
    self.top     = top     or self.top
    self.visible = visible or self.visible
    self.total   = total   or self.total
end

function scrollBar:action(top) end

function scrollBar:mouseUp(x, y)
    local upX   = self.x+2
    local upY   = self.y+2
    local downX = self.x+2
    local downY = self.y+self.h-11
    local butH  = 10
    local butW  = 11

    if x >=upX and x<upX+butW and y>=upY and y<upY+butH and self.top>0 then
        self.top = self.top-1
        self:action(self.top)
    elseif x>=downX and x<downX+butW and y>=downY and y<downY+butH and self.top<self.total-self.visible then
        self.top = self.top+1
        self:action(self.top)
    end
end

function scrollBar:getFocus(n)
    if n==-1 or n==1 then
        self.parent:switchFocus(n)
    end
end


------------------------------------------------------------------
--                         List Widget                          --
------------------------------------------------------------------

sList = class(WWidget)

function sList:init()
    Widget.init(self)
    self.dw = 150
    self.dh = 153

    self.ih = 18

    self.top = 0
    self.sel = 1

    self.font   = {"sansserif", "r", 10}
    self.colors = {50,150,190}
    self.items  = {}
end

function sList:appended()
    self.scrollBar = scrollBar("100", self.top, #self.items,#self.items)
    self:appendWidget(self.scrollBar, -1, 0)

    function self.scrollBar:action(top)
        self.parent.top = top
    end
end


function sList:paint(gc)
    local x = self.x
    local y = self.y
    local w = self.w
    local h = self.h


    local ih  = self.ih
    local top = self.top
    local sel = self.sel

    local items         = self.items
    local visible_items = math.floor(h/ih)
    gc:setColorRGB(255, 255, 255)
    gc:fillRect(x, y, w, h)
    gc:setColorRGB(0, 0, 0)
    gc:drawRect(x, y, w, h)
    gc_clipRect(gc, "set", x, y, w, h)
    gc:setFont(unpack(self.font))



    local label, item
    for i=1, math.min(#items-top, visible_items+1) do
        item  = items[i+top]
        label = textLim(gc, item, w-(5 + 12 + 2 + 1))

        if i+top == sel then
            gc:setColorRGB(unpack(self.colors))
            gc:fillRect(x+1, y + i*ih-ih + 1, w-(12 + 2 + 2), ih)

            gc:setColorRGB(255, 255, 255)
        end

        gc:drawString(label, x+5, y + i*ih-ih , "top")
        gc:setColorRGB(0, 0, 0)
    end

    self.scrollBar:update(top, visible_items, #items)

    gc_clipRect(gc, "reset")
end

function sList:arrowKey(arrow)

    if arrow == "up" then
        if self.sel>1 then
            self.sel = self.sel - 1
            if self.top>=self.sel then
                self.top = self.top - 1
            end
        else
            self.top = self.h/self.ih < #self.items and math.ceil(#self.items - self.h/self.ih) or 0
            self.sel = #self.items
        end
        self:change(self.sel, self.items[self.sel])
    end

    if arrow == "down" then
        if self.sel<#self.items then
            self.sel = self.sel + 1
            if self.sel>(self.h/self.ih)+self.top then
                self.top = self.top + 1
            end
        else
            self.top = 0
            self.sel = 1
        end
        self:change(self.sel, self.items[self.sel])
    end
end


function sList:mouseUp(x, y)
    if x>=self.x and x<self.x+self.w-16 and y>=self.y and y<self.y+self.h then

        local sel = math.floor((y-self.y)/self.ih) + 1 + self.top
        if sel == self.sel then
            self:enterKey()
            return
        end
        if self.items[sel] then
            self.sel = sel
            self:change(self.sel, self.items[self.sel])
        else
            return
        end

        if self.sel>(self.h/self.ih)+self.top then
            self.top = self.top + 1
        end
        if self.top>=self.sel then
            self.top = self.top - 1
        end

    end
    self.scrollBar:mouseUp(x, y)
end


function sList:enterKey()
    if self.items[self.sel] then
        self:action(self.sel, self.items[self.sel])
    end
end


function sList:change() end
function sList:action() end

function sList:reset()
    self.sel = 1
    self.top = 0
end

------------------------------------------------------------------
--                        Screen Widget                         --
------------------------------------------------------------------

sScreen    = class(WWidget)

function sScreen:init(w, h)
    Widget.init(self)
    self.ww     = w
    self.hh     = h
    self.oy     = 0
    self.ox     = 0
    self.noloop = true
end

function sScreen:appended()
    self.oy = 0
    self.ox = 0
end

function sScreen:paint(gc)
    gc_clipRect(gc, "set", self.x, self.y, self.w, self.h)
    self.x = self.x + self.ox
    self.y = self.y + self.oy
end

function sScreen:postPaint(gc)
    gc_clipRect(gc, "reset")
end

function sScreen:setY(y)
    self.oy = y or self.oy
end

function sScreen:setX(x)
    self.ox = x or self.ox
end

function sScreen:showWidget()
    local w  = self:getWidget()
    if not w then print("bye") return end
    local y  = self.y - self.oy
    local wy = w.y - self.oy

    if w.y-2 < y then
        print("Moving up")
        self:setY(-(wy-y)+4)
    elseif w.y+w.h > y+self.h then
        print("moving down")
        self:setY(-(wy-(y+self.h)+w.h+2))
    end

    if self.focus == 1 then
        self:setY(0)
    end
end

function sScreen:getFocus(n)
    if n == -1 or n == 1 then
        self:stealFocus()
        self:switchFocus(n, true)
    end
end

function sScreen:loop(n)
    self.parent:switchFocus(n)
    self:showWidget()
end

function sScreen:focusChange()
    self:showWidget()
end

function sScreen:loseFocus(n)
    if n and ((n >= 1 and self.focus+n<=#self.widgets) or (n <= -1 and self.focus+n>=1)) then
        self:switchFocus(n)
        return -1
    else
        self:stealFocus()
    end

end


-------------------------------------------------------------------------------
--                                    sDropdown                                 --
-------------------------------------------------------------------------------

sDropdown    =    class(Widget)


function sDropdown:init(items)
    self.dh          = 21
    self.dw          = 75
    self.screen      = WScreen()
    self.sList       = sList()
    self.sList.items = items or {}
    self.screen:appendWidget(self.sList,0,0)
    self.sList.action     = self.listAction
    self.sList.loseFocus  = self.screenEscape
    self.sList.change     = self.listChange
    self.screen.escapeKey = self.screenEscape
    self.lak              = self.sList.arrowKey
    self.sList.arrowKey   = self.listArrowKey
    self.value            = items[1] or ""
    self.valuen           = #items>0 and 1 or 0
    self.rvalue           = items[1] or ""
    self.rvaluen          = self.valuen

    self.sList.parentWidget  = self
    self.screen.parentWidget = self
    --self.screen.focus=1
end

function sDropdown:screenpaint(gc)
    gc:setColorRGB(255,255,255)
    gc:fillRect(self.x, self.y, self.h, self.w)
    gc:setColorRGB(0,0,0)
    gc:drawRect(self.x, self.y, self.h, self.w)
end

function sDropdown:mouseDown()
    self:open()
end


sDropdown.img = image.new("\14\0\0\0\7\0\0\0\0\0\0\0\28\0\0\0\16\0\1\000{\239{\239{\239{\239{\239{\239{\239{\239{\239{\239{\239{\239{\239{\239al{\239{\239{\239{\239{\239{\239{\239{\239{\239{\239{\239{\239alalal{\239{\239\255\255\255\255\255\255\255\255\255\255\255\255{\239{\239alalalalal{\239{\239\255\255\255\255\255\255\255\255{\239{\239alalalalalalal{\239{\239\255\255\255\255{\239{\239alalalalalalalalal{\239{\239{\239{\239alalalalalalalalalalal{\239{\239alalalalalal")

function sDropdown:arrowKey(arrow)
    if arrow == "up" then
        self.parent:switchFocus(self.focusUp or -1)
    elseif arrow == "down" then
        self.parent:switchFocus(self.focusDown or 1)
    elseif arrow == "left" then
        self.parent:switchFocus(self.focusLeft or -1)
    elseif arrow == "right" then
        self:open()
    end
end

function sDropdown:listArrowKey(arrow)
    if arrow == "left" then
        self:loseFocus()
    else
        self.parentWidget.lak(self, arrow)
    end
end

function sDropdown:listChange(a, b)
    self.parentWidget.value  = b
    self.parentWidget.valuen = a
end

function sDropdown:open()
    self.screen.yy = self.y+self.h
    self.screen.xx = self.x-1
    self.screen.ww = self.w + 13

    local h = 2+(18*#self.sList.items)

    local py = self.parent.oy and self.parent.y-self.parent.oy or self.parent.y
    local ph = self.parent.h

    self.screen.hh = self.y+self.h+h>ph+py-10 and ph-py-self.y-self.h-10 or h
    if self.y+self.h+h>ph+py-10  and self.screen.hh<40 then
        self.screen.hh = h < self.y and h or self.y-5
        self.screen.yy = self.y-self.screen.hh
    end

    self.sList.ww = self.w + 13
    self.sList.hh = self.screen.hh-2
    self.sList.yy = self.sList.yy+1
    self.sList:giveFocus()

    self.screen:size()
    push_screen_direct(self.screen)
end

function sDropdown:listAction(a,b)
    self.parentWidget.value   = b
    self.parentWidget.valuen  = a
    self.parentWidget.rvalue  = b
    self.parentWidget.rvaluen = a
    self.parentWidget:change(a, b)
    remove_screen()
end

function sDropdown:change() end

function sDropdown:screenEscape()
    self.parentWidget.sList.sel = self.parentWidget.rvaluen
    self.parentWidget.value     = self.parentWidget.rvalue
    if current_screen() == self.parentWidget.screen then
        remove_screen()
    end
end

function sDropdown:paint(gc)
    gc:setColorRGB(255, 255, 255)
    gc:fillRect(self.x, self.y, self.w-1, self.h-1)

    gc:setColorRGB(0,0,0)
    gc:drawRect(self.x, self.y, self.w-1, self.h-1)

    if self.hasFocus then
        gc:setColorRGB(40, 148, 184)
        gc:drawRect(self.x-1, self.y-1, self.w+1, self.h+1)
        gc:setColorRGB(0, 0, 0)
    end

    gc:setColorRGB(192, 192, 192)
    gc:fillRect(self.x+self.w-21, self.y+1, 20, 19)
    gc:setColorRGB(224, 224, 224)
    gc:fillRect(self.x+self.w-22, self.y+1, 1, 19)

    gc:drawImage(self.img, self.x+self.w-18, self.y+9)

    gc:setColorRGB(0,0,0)
    local text = self.value
    if self.unitmode then
        text = text:gsub("([^%d]+)(%d)", numberToSub)
    end

    gc:drawString(textLim(gc, text, self.w-5-22), self.x+5, self.y, "top")
end

----------------------------
-- End of lib/widgets.lua --
----------------------------

------------------------------------
-- Start of FormulaPro/FPMain.lua --
------------------------------------

--------------------------------------
-- Start of FormulaPro/FPSolver.lua --
--------------------------------------

function math.solve(formula, tosolve)
    --local eq="max(exp" .. string.uchar(9654) .. "list(solve(" .. formula .. ", " .. tosolve ..")," .. tosolve .."))"
    local eq  = "nsolve(" .. formula .. ", " .. tosolve .. ")"
    local res = tostring(math.eval(eq)):gsub(utf8(8722), "-")
    --print("-", eq, math.eval(eq), tostring(math.eval(eq)), tostring(math.eval(eq)):gsub(utf8(8722), "-"))
    return tonumber(res)
end

function round(num, idp)
    if num >= 0.001 or num <= -0.001 then
        local mult = 10 ^ (idp or 0)
        if num >= 0 then
            return math.floor(num * mult + 0.5) / mult
        else
            return math.ceil(num * mult - 0.5) / mult
        end
    else
        return tonumber(string.format("%.0" .. (idp + 1) .. "g", num))
    end
end

math.round = round -- just in case

function find_data(known, cid, sid)
    local done = {}

    for _, var in ipairs(var.list()) do
        math.eval("delvar " .. var)
    end

    for key, value in pairs(known) do
        var.store(key, value)
    end

    local no
    local dirty_exit    = true
    local tosolve
    local couldnotsolve = {}

    local loops = 0
    while dirty_exit do
        loops = loops + 1
        if loops == 100 then error("too many loops!") end
        dirty_exit = false

        for i, formula in ipairs(Formulas) do

            local skip = false
            if couldnotsolve[formula] then
                skip = true
                for k, v in pairs(known) do
                    if not couldnotsolve[formula][k] then
                        skip = false
                        couldnotsolve[formula] = nil
                        break
                    end
                end
            end

            if ((not cid) or (cid and formula.category == cid)) and ((not sid) or (formula.category == cid and formula.sub == sid)) and not skip then
                no = 0

                for var in pairs(formula.variables) do
                    if not known[var] then
                        no      = no + 1
                        tosolve = var
                        if no == 2 then break end
                    end
                end

                if no == 1 then
                    print("Solving " .. tosolve .. " for " .. formula.formula)

                    local sol, r = math.solve(formula.formula, tosolve)
                    if sol then
                        sol                    = round(sol, 4)
                        known[tosolve]         = sol
                        done[formula]          = true
                        var.store(tosolve, sol)
                        couldnotsolve[formula] = nil
                        print(tosolve .. " = " .. sol)
                    else
                        print("Oops! Something went wrong:", r)
                        -- Need to issue a warning dialog
                        couldnotsolve[formula] = copyTable(known)
                    end
                    dirty_exit = true
                    break

                elseif no == 2 then
                    print("Cannot solve " .. formula.formula .. ": unknow value of multiple variables.")
                end
            end
        end
    end

    return known
end

------------------------------------
-- End of FormulaPro/FPSolver.lua --
------------------------------------

-----------------------------------
-- Start of FormulaPro/FPGui.lua --
-----------------------------------

CategorySel = WScreen()

CategorySel.iconS       = 48
CategorySel.sublist     = sList()
CategorySel:appendWidget(CategorySel.sublist, 5, 5 + 24)
CategorySel.sublist:setSize(-10, -70)
CategorySel.sublist.cid = 0

function CategorySel.sublist:action(sid)
    push_screen(SubCatSel, sid)
end

function CategorySel:charIn(ch)
    if ch == "l" then
        loadExtDB()
        self:pushed() -- refresh list
        self:invalidate() -- asks for screen repaint
    end
end

function CategorySel:paint(gc)
    gc:setColorRGB(255, 255, 255)
    gc:fillRect(self.x, self.y, self.w, self.h)

    if not kIsInSubCatScreen then
        gc:setColorRGB(0, 0, 0)
        gc:setFont("sansserif", "r", 16)
        gc:drawString(pInfo["name"], self.x + 5, 0, "top")

        gc:setFont("sansserif", "r", 12)
        gc:drawString(pInfo["ver"], self.x + .4 * self.w, 4, "top")

        gc:setFont("sansserif", "r", 12)
        gc:drawString("by "..pInfo["by"], self.x + self.w - gc:getStringWidth("by "..pInfo["by"]) - 5, 4, "top")

        gc:setColorRGB(220, 220, 220)
        gc:setFont("sansserif", "r", 8)
        gc:drawRect(5, self.h - 46 + 10, self.w - 10, 25 + 6)
        gc:setColorRGB(128, 128, 128)
    end

    local splinfo = Categories[self.sublist.sel].info:split("\n")
    for i, str in ipairs(splinfo) do
        gc:drawString(str, self.x + 7, self.h - 56 + 12 + i * 10, "top")
    end
    self.sublist:giveFocus()
end

function CategorySel:pushed()
    local items = {}

    for cid, cat in ipairs(Categories) do
        table.insert(items, cat.name)
    end

    self.sublist.items = items
    self.sublist:giveFocus()
end

function CategorySel:tabKey()
    push_screen_back(Ref)
end


SubCatSel = WScreen()

SubCatSel.sel         = 1
SubCatSel.sublist     = sList()
SubCatSel:appendWidget(SubCatSel.sublist, 5, 5 + 24)
SubCatSel.back        = sButton(utf8(9664) .. " Back")
SubCatSel:appendWidget(SubCatSel.back, 5, -5)
SubCatSel.sublist:setSize(-10, -66)
SubCatSel.sublist.cid = 0

function SubCatSel.back:action()
    SubCatSel:escapeKey()
end

function SubCatSel.sublist:action(sub)
    local cid = self.parent.cid
    if #Categories[cid].sub[sub].formulas > 0 then
        push_screen(manualSolver, cid, sub)
    end
end

function SubCatSel:paint(gc)
    gc:setColorRGB(255, 255, 255)
    gc:fillRect(self.x, self.y, self.w, self.h)
    gc:setColorRGB(0, 0, 0)
    gc:setFont("sansserif", "r", 16)
    gc:drawString(Categories[self.cid].name, self.x + 5, 0, "top")
end

function SubCatSel:pushed(sel)

    kIsInSubCatScreen = true
    self.cid          = sel
    local items = {}
    for sid, subcat in ipairs(Categories[sel].sub) do
        table.insert(items, subcat.name .. (#subcat.formulas == 0 and " (Empty)" or ""))
    end

    if self.sublist.cid ~= sel then
        self.sublist.cid = sel
        self.sublist:reset()
    end

    self.sublist.items = items
    self.sublist:giveFocus()
end

function SubCatSel:escapeKey()
    kIsInSubCatScreen = false
    only_screen_back(CategorySel)
end



-------------------
-- Manual solver --
-------------------

manualSolver    = WScreen()
manualSolver.pl = sScreen(-20, -50)
manualSolver:appendWidget(manualSolver.pl, 2, 4)

manualSolver.sb = scrollBar(-50)
manualSolver:appendWidget(manualSolver.sb, -2, 3)

manualSolver.back = sButton(utf8(9664) .. " Back")
manualSolver:appendWidget(manualSolver.back, 5, -5)

manualSolver.usedFormulas = sButton("Formulas")
manualSolver:appendWidget(manualSolver.usedFormulas, -5, -5)

function manualSolver.back:action()
    manualSolver:escapeKey()
end

function manualSolver.usedFormulas:action()
    push_screen_direct(usedFormulas)
end

function manualSolver.sb:action(top)
    self.parent.pl:setY(4 - top * 30)
end

function manualSolver:paint(gc)
    gc:setColorRGB(224, 224, 224)
    gc:fillRect(self.x, self.y, self.w, self.h)
    gc:setColorRGB(128, 128, 128)
    gc:fillRect(self.x + 5, self.y + self.h - 42, self.w - 10, 2)
    self.sb:update(math.floor(-(self.pl.oy - 4) / 30 + .5))

    gc:setFont("sansserif", "r", 10)
    local name = self.sub.name
    local len  = gc:getStringWidth(name)
    if len >= .7*self.w then name = string.sub(name, 1, -10) .. ". " end
    local len = gc:getStringWidth(name)
    local x   = self.x + (self.w - len) / 2

    --gc:setColorRGB(255,255,255)
    --gc:fillRect(x-3, 10, len+6, 18)

    gc:setColorRGB(0, 0, 0)
    gc:drawString(name, x, self.h - 28, "top")
    --gc:drawRect(x-3, 10, len+6, 18)
end

function manualSolver:postPaint(gc)
    --gc:setColorRGB(128,128,128)
    --gc:drawRect(self.x, self.y, self.w, self.h-46)
end

basicFuncsInited    = false
elementValuesInited = false

function manualSolver:pushed(cid, sid)

    if not basicFuncsInited then
        initBasicFunctions()
        basicFuncsInited = true
    end

    if not elementValuesInited then
        initElementValues()
        elementValuesInited = true
    end

    self.pl.widgets = {}
    self.pl.focus   = 0
    self.cid        = cid
    self.sid        = sid
    self.sub        = Categories[cid].sub[sid]
    self.pl.oy      = 0
    self.known      = {}
    self.inputs     = {}
    self.constants  = {}

    local inp, lbl
    local i = 0
    local nodropdown, lastdropdown
    for variable, _ in pairs(self.sub.variables) do


        if not Constants[variable] or Categories[cid].varlink[variable] then
            i = i + 1
            inp = sInput()
            inp.value = ""
            --inp.number = true

            function inp:enterKey()
                if not tonumber(self.value) and #self.value > 0 then
                    if not manualSolver:preSolve(self) then
                        self.value = self.value .. "   " .. utf8(8658) .. " Invalid input"
                    end
                end
                manualSolver:solve()
                self.parent:switchFocus(1)
            end

            self.inputs[variable] = inp
            inp.ww        = -145
            inp.focusDown = 4
            inp.focusUp   = -2
            lbl           = sLabel(variable, inp)

            self.pl:appendWidget(inp, 60, i * 30 - 28)
            self.pl:appendWidget(lbl, 2, i * 30 - 28)
            self.pl:appendWidget(sLabel(":", inp), 50, i * 30 - 28)

            print(variable)
            local variabledata = Categories[cid].varlink[variable]
            inp.placeholder = variabledata.info

            if nodropdown then
                inp.focusUp = -1
            end

            if variabledata then
                if variabledata.unit ~= "nounit" then
                    --unitlbl = sLabel(variabledata.unit:gsub("([^%d]+)(%d)", numberToSub))
                    local itms = { variabledata.unit }
                    for k, _ in pairs(Units[variabledata.unit]) do
                        table.insert(itms, k)
                    end
                    inp.dropdown           = sDropdown(itms)
                    inp.dropdown.unitmode  = true
                    inp.dropdown.change    = self.update
                    inp.dropdown.focusUp   = nodropdown and -5 or -4
                    inp.dropdown.focusDown = 2
                    self.pl:appendWidget(inp.dropdown, -2, i * 30 - 28)
                    nodropdown             = false
                    lastdropdown           = inp.dropdown
                else
                    self.pl:appendWidget(sLabel(""), -32, i * 30 - 28)
                end
            else
                nodropdown    = true
                inp.focusDown = 1
                if lastdropdown then
                    lastdropdown.focusDown = 1
                    lastdropdown           = false
                end
            end

            inp.getFocus = manualSolver.update
        else
            self.constants[variable] = math.eval(Constants[variable].value)
            --var.store(variable, self.known[variable])
        end
    end
    inp.focusDown = 1

    manualSolver.sb:update(0, math.floor(self.pl.h / 30 + .5), i)
    self.pl:giveFocus()

    self.pl.focus                = 1
    self.pl:getWidget().hasFocus = true
    self.pl:getWidget():getFocus()
end

function manualSolver.update()
    manualSolver:solve()
end

function manualSolver:preSolve(input)
    local res, err
    res, err = math.eval(input.value)
    res      = res and round(res, 4)
    print("Presolve : ", input.value .. " = " .. tostring(res), "(err ? = " .. tostring(err) .. ")")
    input.value = res and tostring(res) or input.value
    return res and 1 or false
end

function manualSolver:solve()
    local inputed  = {}
    local disabled = {}

    for variable, input in pairs(self.inputs) do
        local variabledata = Categories[self.cid].varlink[variable]
        if input.disabled then
            inputed[variable] = nil
            input.value = ""
        end

        input:enable()
        if input.value ~= "" then
            local tmpstr = input.value:gsub(utf8(8722), "-")
            inputed[variable] = tonumber(tmpstr)
            if input.dropdown and input.dropdown.rvalue ~= variabledata.unit then
                inputed[variable] = Units.subToMain(variabledata.unit, input.dropdown.rvalue, inputed[variable])
            end
        end
    end

    local invs = copyTable(inputed)
    for k, v in pairs(self.constants) do
        invs[k] = v
    end
    self.known = find_data(invs, self.cid, self.sid)

    for variable, value in pairs(self.known) do
        if (not inputed[variable] and self.inputs[variable]) then
            local variabledata = Categories[self.cid].varlink[variable]
            local result       = tostring(value)
            local input        = self.inputs[variable]

            if input.dropdown and input.dropdown.rvalue ~= variabledata.unit then
                result = Units.mainToSub(variabledata.unit, input.dropdown.rvalue, result)
            end

            input.value = result
            input:disable()
        end
    end
end

function manualSolver:escapeKey()
    only_screen_back(SubCatSel, self.cid)
end

function manualSolver:contextMenu()
    push_screen_direct(usedFormulas)
end

usedFormulas = Dialog("Used formulas", 10, 10, -20, -20)

usedFormulas.but = sButton("Close")

usedFormulas:appendWidget(usedFormulas.but, -10, -5)

function usedFormulas:postPaint(gc)
    if self.ed then
        self.ed:move(self.x + 5, self.y + 30)
        self.ed:resize(self.w - 9, self.h - 74)
    end

    nativeBar(gc, self, self.h - 40)
end

function usedFormulas:pushed()
    doNotDisplayIcon = true
    self.ed = D2Editor.newRichText()
    self.ed:setReadOnly(true)
    local cont = ""

    local fmls = #manualSolver.sub.formulas
    for k, v in ipairs(manualSolver.sub.formulas) do
        cont = cont .. k .. ": \\0el {" .. v.formula .. "} " .. (k < fmls and "\n" or "")
    end

    if self.ed.setExpression then
        self.ed:setExpression(cont, 1)
        self.ed:registerFilter{ escapeKey = usedFormulas.closeEditor, enterKey = usedFormulas.closeEditor, tabKey = usedFormulas.leaveEditor }
        self.ed:setFocus(true)
    else
        self.ed:setText(cont, 1)
    end

    self.but:giveFocus()
end

function usedFormulas.leaveEditor()
    platform.window:setFocus(true)
    usedFormulas.but:giveFocus()
    return true
end

function usedFormulas.closeEditor()
    platform.window:setFocus(true)
    if current_screen() == usedFormulas then
        remove_screen()
    end
    doNotDisplayIcon = false
    return true
end

function usedFormulas:screenLoseFocus()
    self:removed()
end

function usedFormulas:screenGetFocus()
    self:pushed()
end

function usedFormulas:removed()
    if usedFormulas.ed.setVisible then
        usedFormulas.ed:setVisible(false)
    else
        usedFormulas.ed:setText("")
        usedFormulas.ed:resize(1, 1)
        usedFormulas.ed:move(-10, -10)
    end
    usedFormulas.ed  = nil
    doNotDisplayIcon = false
end

function usedFormulas.but.action(self)
    remove_screen()
end

---------------------------------
-- End of FormulaPro/FPGui.lua --
---------------------------------


function initBasicFunctions()
    local basicFunctions = {
        ["erf"]    = [[Define erf(x)=Func:2/sqrt(pi)*integral(exp(-t*t),t,0,x):EndFunc]],
        ["erfc"]   = [[Define erfc(x)=Func:1-erf(x):EndFunc]],
        ["ni"]     = [[Define ni(ttt)=Func:7.7835*10^21*ttt^(3/2)*exp((4.73*10^-4*ttt^2/(ttt+636)-1.17)/(1.72143086667*10^-4*ttt)):EndFunc]],
        ["eegalv"] = [[Define eegalv(rrx,rr2,rr3,rr4,rrg,rrs,vs)=Func:Local rra,rrb,rrc,vb,rg34,rx2ab: rg34:=rrg+rr3+rr4:  rra:=((rrg*rr3)/(rg34)): rrb:=((rrg*rr4)/(rg34)): rrc:=((rr3*rr4)/(rg34)): rx2ab:=rrx+rr2+rra+rrb: rra:=((rrg*rr3)/(rg34)): vb:=((((vs*(rrx+rra)*(rr2+rrb))/(rx2ab)))/(rrs+rrc+(((rrx+rra)*(rr2+rrb))/(rx2ab)))): vb*(((rx)/(rrx+rra))-((rr2)/(rr2+rrb))):Return :EndFunc]],
        }
    for var, func in pairs(basicFunctions) do
        math.eval(func .. ":Lock " .. var) -- defines and prevents against delvar.
    end
end
----------------------------------
-- End of FormulaPro/FPMain.lua --
----------------------------------

------------------------------------
-- Start of reference/RefMain.lua --
------------------------------------

------------------------------------------
-- Start of reference/REFSIPrefixes.lua --
------------------------------------------

SIPrefixes = Screen()

SIPrefixes.prefixes1 = {
	{"Y",  "Yotta",    "24" },
	{"Z",  "Zetta",    "21" },
	{"E",  "Exa",      "18" },
	{"P",  "Peta",     "15" },
	{"T",  "Tera",     "12" },
	{"G",  "Giga",     "9" },
	{"M",  "Mega",     "6" },
	{"k",  "Kilo",     "3" },
	{"h",  "Hecto",    "2" },
	{"da", "Deka",     "1" }
}

SIPrefixes.prefixes2 = {
	{"d",  "Deci", "-1" },
	{"c",  "Centi", "-2" },
	{"m",  "Milli", "-3" },
	{utf8(956), "Micro", "-6" },
	{"n", "Nano", "-9" },
	{"p", "Pico", "-12" },
	{"f", "Femto", "-15" },
	{"a", "Atto", "-18" },
	{"z", "Zepto", "-21" },
	{"y", "Yocto", "-24" }
}

function SIPrefixes:paint(gc)
	gc:setColorRGB(255,255,255)
	gc:fillRect(self.x, self.y, self.w, self.h)
	gc:setColorRGB(0,0,0)

    local msg = "SI Prefixes  "
    gc:setFont("sansserif","b",12)
    drawXCenteredString(gc,msg,0)
    gc:setFont("sansserif","r",12)
    for k,v in ipairs(SIPrefixes.prefixes1) do
            gc:drawString("10", 5+.03*self.w, 3+19*k, "top")
            gc:drawString(v[3], 23+.03*self.w, 19*k-3, "top")
            gc:drawString(" : " .. v[2], 45+.03*self.w, 3+19*k, "top")
            gc:drawString("  (" .. v[1] .. ")", 98+.03*self.w, 3+19*k, "top")
    end
    for k,v in ipairs(SIPrefixes.prefixes2) do
            gc:drawString("10", 5+.52*self.w, 3+19*k, "top")
            gc:drawString(v[3], 23+.52*self.w, 19*k-3, "top")
            gc:drawString("  : " .. v[2], 45+.52*self.w, 3+19*k, "top")
            gc:drawString("  (" .. v[1] .. ")", 100+.52*self.w, 3+19*k, "top")
    end
end

function SIPrefixes:escapeKey()
	only_screen_back(Ref)
end

----------------------------------------
-- End of reference/REFSIPrefixes.lua --
----------------------------------------

---------------------------------------------
-- Start of reference/REFGreekAlphabet.lua --
---------------------------------------------

Greek = Screen()

Greek.font = "serif"

Greek.alphabet1 = {
    {utf8(913), utf8(945), "Alpha"},
    {utf8(914), utf8(946), "Beta"},
    {utf8(915), utf8(947), "Gamma"},
    {utf8(916), utf8(948), "Delta"},
    {utf8(917), utf8(949), "Epsilon"},
    {utf8(918), utf8(950), "Zeta"},
    {utf8(919), utf8(951), "Eta"},
    {utf8(920), utf8(952), "Theta"}
}
Greek.alphabet2 = {
    {utf8(921), utf8(953), "Iota"},
    {utf8(922), utf8(954), "Kappa"},
    {utf8(923), utf8(955), "Lambda"},
    {utf8(924), utf8(956), "Mu"},
    {utf8(925), utf8(957), "Nu"},
    {utf8(926), utf8(958), "Xi"},
    {utf8(927), utf8(959), "Omicron"},
    {utf8(928), utf8(960), "Pi"}
}
Greek.alphabet3 = {
    {utf8(929), utf8(961), "Rho"},
    {utf8(931), utf8(963), "Sigma"},
    {utf8(932), utf8(964), "Tau"},
    {utf8(933), utf8(965), "Upsilon"},
    {utf8(934), utf8(966), "Phi"},
    {utf8(935), utf8(967), "Chi"},
    {utf8(936), utf8(968), "Psi"},
    {utf8(937), utf8(969), "Omega"}
}

function Greek:paint(gc)
    gc:setColorRGB(255,255,255)
    gc:fillRect(self.x, self.y, self.w, self.h)
    gc:setColorRGB(0,0,0)

        local msg = "Greek Alphabet"
        gc:setFont("sansserif","b",12)
        drawXCenteredString(gc,msg,5)
        gc:setFont(Greek.font,"r",12)
        for k,v in ipairs(Greek.alphabet1) do
                gc:drawString(v[3] .. " : " .. v[1] .. " " .. v[2], 5, 10+22*k, "top")
        end
        for k,v in ipairs(Greek.alphabet2) do
                gc:drawString(v[3] .. " : " .. v[1] .. " " .. v[2], 5+.34*pww(), 10+22*k, "top")
        end
        for k,v in ipairs(Greek.alphabet3) do
                gc:drawString(v[3] .. " : " .. v[1] .. " " .. v[2], 5+.67*pww(), 10+22*k, "top")
        end
end

function Greek:enterKey()
    Greek.font = Greek.font == "serif" and "sansserif" or "serif"
    Greek:invalidate()
end

function Greek:escapeKey()
    only_screen_back(Ref)
end

-------------------------------------------
-- End of reference/REFGreekAlphabet.lua --
-------------------------------------------

-----------------------------------------
-- Start of reference/REFConstants.lua --
-----------------------------------------

RefConstants = Screen()

RefConstants.data = refCon()

RefConstants.tmpScroll = 1
RefConstants.leftRight = 1

function RefConstants:arrowKey(arrw)
    if arrw == "up" then
        RefConstants.tmpScroll = RefConstants.tmpScroll - test(RefConstants.tmpScroll>1)
    end
    if arrw == "down" then
        RefConstants.tmpScroll = RefConstants.tmpScroll + test(RefConstants.tmpScroll<(table.getn(RefConstants.data)-7))
    end
    if arrw == "left" then
        RefConstants.leftRight = RefConstants.leftRight - 5*test(RefConstants.leftRight>1)
    end
    if arrw == "right" then
        RefConstants.leftRight = RefConstants.leftRight + 5*test(RefConstants.leftRight<150)
    end
    screenRefresh()
end

function RefConstants:paint(gc)
    gc:setColorRGB(255,255,255)
    gc:fillRect(self.x, self.y, self.w, self.h)
    gc:setColorRGB(0,0,0)

        msg = "Physical Constants: "
        gc:setFont("sansserif","b",12)
        if RefConstants.leftRight > 1 then
            gc:drawString(utf8(9664),4,0,"top")
        end
        if RefConstants.leftRight < 160 then
            gc:drawString(utf8(9654),pww()-gc:getStringWidth(utf8(9660))-2,0,"top")
        end
        if RefConstants.tmpScroll > 1 then
            gc:drawString(utf8(9650),gc:getStringWidth(utf8(9664))+7,0,"top")
        end
        if RefConstants.tmpScroll < table.getn(RefConstants.data)-7 then
            gc:drawString(utf8(9660),pww()-4*gc:getStringWidth(utf8(9654))-2,0,"top")
        end
        drawXCenteredString(gc,msg,4)
        gc:setFont("sansserif","r",12)

           local tmp = 0
           for k=RefConstants.tmpScroll,table.getn(RefConstants.data) do
            tmp = tmp + 1
               gc:setFont("sansserif","b",12)
            gc:drawString(RefConstants.data[k][1], 5-RefConstants.leftRight, 5+22*tmp, "top")
            gc:setFont("sansserif","r",12)
            gc:drawString("  (" .. RefConstants.data[k][2] .. "): " .. RefConstants.data[k][3], gc:getStringWidth(RefConstants.data[k][1])+15-RefConstants.leftRight, 5+22*tmp, "top")
        end
end

function RefConstants:escapeKey()
    only_screen_back(Ref)
end

---------------------------------------
-- End of reference/REFConstants.lua --
---------------------------------------

---------------------------------------
-- Start of reference/REFBoolAlg.lua --
---------------------------------------

RefBoolAlg = Screen()

RefBoolAlg.data = {
    { "x+0=x", "x.1=x", "Identity" },
    { "x+x'=1", "x.x'=0", "Inverse" },
    { "x+x=x", "x.x=x", "Idempotent" },
    { "x+1=1", "x.0=0", "Null Element" },
    { "(x')'=x", "(x')'=x", "Involution" },
    { "x+y=y+x", "x.y=y.x", "Commutative" },
    { "x+(y+z)=(x+y)+z", "x.(y.z)=(x.y).z", "Associative" },
    { "x.(y+z)=(x.y)+(x.z)", "x+(y.z)=(x+y).(x+z)", "Distributive" },
    { "x+(x.y)=x", "x.(x+y)=x", "Absorption" },
    { "(x+y+z)'=x'.y'.z'", "(x.y.z)'=x'+y'+z'", "DeMorgan's Law" },
    { "(x.y)+(x'.z)+(y.z)=(x.y)+(x'.z)", "(x+y).(x'+z).(y+z)=(x+y).(x'+z)", "Consensus" }
}

RefBoolAlg.tmpScroll = 1
RefBoolAlg.dual = false

function RefBoolAlg:arrowKey(arrw)
    if pww() < 330 then
        if arrw == "up" then
            RefBoolAlg.tmpScroll = RefBoolAlg.tmpScroll - test(RefBoolAlg.tmpScroll > 1)
        end
        if arrw == "down" then
            RefBoolAlg.tmpScroll = RefBoolAlg.tmpScroll + test(RefBoolAlg.tmpScroll < (table.getn(RefBoolAlg.data) - 7))
        end
        screenRefresh()
    end
end

function RefBoolAlg:enterKey()
    RefBoolAlg.dual = not RefBoolAlg.dual
    RefBoolAlg:invalidate()
end

function RefBoolAlg:escapeKey()
    only_screen_back(Ref)
end

function RefBoolAlg:paint(gc)
    gc:setColorRGB(255, 255, 255)
    gc:fillRect(self.x, self.y, self.w, self.h)
    gc:setColorRGB(0, 0, 0)

    msg = "Boolean Algebra : "
    gc:setFont("sansserif", "b", 12)
    if RefBoolAlg.tmpScroll > 1 and pww() < 330 then
        gc:drawString(utf8(9650), gc:getStringWidth(utf8(9664)) + 7, 0, "top")
    end
    if RefBoolAlg.tmpScroll < table.getn(RefBoolAlg.data) - 7 and pww() < 330 then
        gc:drawString(utf8(9660), pww() - 4 * gc:getStringWidth(utf8(9654)) - 2, 0, "top")
    end
    drawXCenteredString(gc, msg, 0)
    gc:setFont("sansserif", "i", 12)
    drawXCenteredString(gc, "Press Enter for Dual ", 15)
    gc:setFont("sansserif", "r", 12)

    local tmp = 0
    for k = RefBoolAlg.tmpScroll, table.getn(RefBoolAlg.data) do
        tmp = tmp + 1
        gc:setFont("sansserif", "b", 12)
        gc:drawString(RefBoolAlg.data[k][3], 3, 10 + 22 * tmp, "top")
        gc:setFont("sansserif", "r", 12)
        gc:drawString(RefBoolAlg.data[k][1 + test(RefBoolAlg.dual)], 125 - 32 * test(k == 11) * test(pww() < 330) + 30 * test(pww() > 330) + 12, 10 + 22 * tmp, "top")
    end
end

-------------------------------------
-- End of reference/REFBoolAlg.lua --
-------------------------------------

----------------------------------------
-- Start of reference/REFBoolExpr.lua --
----------------------------------------

RefBoolExpr = Screen()

RefBoolExpr.data = {
{"F0","0","Null"},
{"F1","x.y","AND"},
{"F2","x.y'","Inhibition"},
{"F3","x","Transfer"},
{"F4","x'.y","Inhibition"},
{"F5","y","Transfer"},
{"F6","(x.y')+(x'.y)","Exclusive OR (XOR)"},
{"F7","x+y","OR"},
{"F8","(x+y)'","NOT OR (NOR)"},
{"F9","(x.y)+(x'.y')","Equivalence (XNOR)"},
{"F10","y'","Complement NOT"},
{"F11","x+y'","Implication"},
{"F12","x'","Complement (NOT)"},
{"F13","x'+y","Implication"},
{"F14","(x.y)'","NOT AND (NAND)"},
{"F15","1","Identity"}
}

RefBoolExpr.tmpScroll = 1

function RefBoolExpr:arrowKey(arrw)
	if arrw == "up" then
		RefBoolExpr.tmpScroll = RefBoolExpr.tmpScroll - test(RefBoolExpr.tmpScroll>1)
	end
	if arrw == "down" then
		RefBoolExpr.tmpScroll = RefBoolExpr.tmpScroll + test(RefBoolExpr.tmpScroll<(table.getn(RefBoolExpr.data)-7))
	end
	screenRefresh()
end

function RefBoolExpr:paint(gc)
	gc:setColorRGB(255,255,255)
	gc:fillRect(self.x, self.y, self.w, self.h)
	gc:setColorRGB(0,0,0)

	    msg = "Boolean Expressions : "
        gc:setFont("sansserif","b",12)
        if RefBoolExpr.tmpScroll > 1 then
        	gc:drawString(utf8(9650),gc:getStringWidth(utf8(9664))+7,0,"top")
        end
        if RefBoolExpr.tmpScroll < table.getn(RefBoolExpr.data)-7 then
        	gc:drawString(utf8(9660),pww()-4*gc:getStringWidth(utf8(9654))-2,0,"top")
        end
        drawXCenteredString(gc,msg,4)
        gc:setFont("sansserif","r",12)

       	local tmp = 0
       	for k=RefBoolExpr.tmpScroll,table.getn(RefBoolExpr.data) do
       		tmp = tmp + 1
       		gc:setFont("sansserif","b",12)
            gc:drawString(RefBoolExpr.data[k][1], 5, 5+22*tmp, "top")
        	gc:setFont("sansserif","r",12)
            gc:drawString(RefBoolExpr.data[k][2], 40+30*test(pww()>330)+15, 5+22*tmp, "top")
		    gc:drawString(RefBoolExpr.data[k][3], 134+50*test(pww()>330)+15, 5+22*tmp, "top")
		end
end

function RefBoolExpr:escapeKey()
	only_screen_back(Ref)
end

--------------------------------------
-- End of reference/REFBoolExpr.lua --
--------------------------------------

-- do not include "REFDisplacement.lua"
-- do not include "REFVelocity.lua"
-- do not include "REFAcceleration.lua"
-- do not include "REFTime.lua"
-- do not include "REFForce.lua"
-- do not include "REFEnergy.lua"
-- do not include "REFPower.lua"
-- do not include "REFMotionVars.lua"

References = {
    {title="SI Prefixes",           info="",    screen=SIPrefixes},
    {title="Greek Alphabet",        info="",    screen=Greek},
    {title="Constants",             info="",    screen=RefConstants},
    {title="BoolAlg",               info="",    screen=RefBoolAlg},
    {title="BoolExpr",              info="",    screen=RefBoolExpr},
    -- {title="Displacement Units",    info="",    screen=RefDisplacement},
    -- {title="Velocity Units",        info="",    screen=RefVelocity},
    -- {title="Acceleration Units",    info="",    screen=RefAcceleration},
    -- {title="Time Units",            info="",    screen=RefTime},
    -- {title="Force Units",           info="",    screen=RefForce},
    -- {title="Energy Units",          info="",    screen=RefEnergy},
    -- {title="Power Units",           info="",    screen=RefPower},
    -- {title="Motion Variables",      info="",    screen=MotionVars}
}

Ref = WScreen()

RefList = sList()
RefList:setSize(-8, -32)

Ref:appendWidget(RefList, 4, Ref.y+28)

function Ref.addRefs()
    for n, ref in ipairs(References) do
        if ref.screen then
            table.insert(RefList.items, ref.title)
        else
            table.insert(RefList.items, ref.title .. " (WIP)")
        end
    end
end

function RefList:action(ref)
    if References[ref].screen then
        push_screen(References[ref].screen)
    end
end

function Ref:pushed()
    RefList:giveFocus()
end

function Ref:paint(gc)
    gc:setFont("sansserif", "b", 16)
    gc:drawString("Reference", self.x+6, -2, "top")
    gc:setFont("serif", "r", 12)
end

function Ref:tabKey()
    push_screen(CategorySel)
end

Ref.escapeKey = Ref.tabKey

Ref.addRefs()

----------------------------------
-- End of reference/RefMain.lua --
----------------------------------


aboutWindow = Dialog("About", 50, 20, 280, 180)

local origInfoStr = "Orig Code:\nFormulaPro v1.4a LGPL3\nJim Bauwens, Adrien \"Adriweb\" Bertrand, Levak\ntiplanet.org - inspired-lua.org"
local aboutstr = infoStr.."\n"..origInfoStr
local aboutButton   = sButton("OK")

for i, line in ipairs(aboutstr:split("\n")) do
    local aboutlabel    = sLabel(line)
    aboutWindow:appendWidget(aboutlabel, 10, 27 + i*14-12)
end

aboutWindow:appendWidget(aboutButton,-10,-5)

function aboutWindow:postPaint(gc)
    nativeBar(gc, self, self.h-40)
    on.help = function() return 0 end
end

aboutButton:giveFocus()

function aboutButton:action()
    remove_screen(aboutWindow)
    on.help = function() push_screen_direct(aboutWindow) end
end

function on.help()
    push_screen_direct(aboutWindow)
end

function errorPopup(gc)

    errorHandler.display = false
    errorDialog = Dialog("Oops...", 50, 20, "85", "80")

    local textMessage   = [[PhysPro has encountered an error:
Error at line ]]..errorHandler.errorLine
    local errorOKButton = sButton("OK")

    for i, line in ipairs(textMessage:split("\n")) do
        local errorLabel = sLabel(line)
        errorDialog:appendWidget(errorLabel, 10, 27 + i*14-12)
    end

    errorDialog:appendWidget(errorOKButton,-10,-5)

    function errorDialog:postPaint(gc)
        nativeBar(gc, self, self.h-40)
    end

    errorOKButton:giveFocus()

    function errorOKButton:action()
        remove_screen(errorDialog)
        errorHandler.errorMessage = nil
    end

    push_screen_direct(errorDialog)
end

---------------------------------------------------------------

function on.create()
    platform.os = "3.1"
end

function on.construction()
    platform.os = "3.2"
end

errorHandler = {}

function handleError(line, errMsg, callStack, locals)
    print("Error handled!", errMsg)
    errorHandler.display = true
    errorHandler.errorMessage = errMsg
    errorHandler.errorLine = line
    errorHandler.callStack = callStack
    errorHandler.locals = locals
    platform.window:invalidate()
    return true --go on....
end

if platform.registerErrorHandler then
    platform.registerErrorHandler( handleError )
end

---------------------------------------------- Launch!

push_screen_direct(CategorySel)
