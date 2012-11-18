--------------------------------------------------------
--                      Database                      --
--------------------------------------------------------

function checkIfExists(table, name)
    for k,v in pairs(table) do
        if (v.name == name) or (v == name) then
            print("Conflict (elements appearing twice) detected when loading Database. Skipping the item.")
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

Categories	=	{}
Formulas	=	{}

function addCat(id,name,info)
    if not checkIfExists(Categories, name) then
        return table.insert(Categories, id, {id=id, name=name, info=info, sub={}, varlink={}})
    else
        return -1
    end
end

function addCatVar(cid, var, info, unit)
    Categories[cid].varlink[var] = {unit=unit, info=info }
end

function addSubCat(cid, id, name, info)
    if not checkIfExists(Categories[cid].sub, name) then
        return table.insert(Categories[cid].sub, id, {category=cid, id=id, name=name, info=info, formulas={}, variables={}})
    else
        return -1
    end
end

function aF(cid, sid, formula, variables) --add Formula
	local fr	=	{category=cid, sub=sid, formula=formula, variables=variables}
	-- In times like this we are happy that inserting tables just inserts a reference

    if not checkIfFormulaExists(Formulas, fr.formula) then
        table.insert(Formulas, fr)
    end
    if not checkIfFormulaExists(Categories[cid].sub[sid].formulas, fr.formula) then
        table.insert(Categories[cid].sub[sid].formulas, fr)
    end
	
	-- This function might need to be merged with U(...)
	for variable,_ in pairs(variables) do
		Categories[cid].sub[sid].variables[variable]	= true
	end
end

function U(...)
	local out	= {}
	for i, p in ipairs({...}) do
		out[p]	= true
	end
	return out
end

----------------------------------------------
-- Categories && Sub-Categories && Formulas --
----------------------------------------------

c_th = utf8(952)
c_om = utf8(969)
c_la = utf8(955)
c_ep = utf8(949)
c_de = utf8(916)
c_ph = utf8(966)
c_pi = utf8(960)

addCat(1, "Motion", "Performs calculations of motion-related stuff")

addCatVar(1,    "u",        "Intial velocity",              "m/s"       )
addCatVar(1,    "v",        "Final velocity",               "m/s"       )
addCatVar(1,    "dv",       "Change in velocity",           "m/s"       )
addCatVar(1,    "s",        "Displacement",                 "m"         )
addCatVar(1,    "t",        "Time",                         "s"         )
addCatVar(1,    "a",        "Accleration",                  "m/s2"      )
addCatVar(1,    "F",        "Force",                        "N"         )
addCatVar(1,    "m",        "Mass",                         "kg"        )
addCatVar(1,    "W",        "Work",                         "J"         )
addCatVar(1,    "P",        "Power",                        "W"         )
addCatVar(1,    "g",        "Gravity Acc.",                 "m/s2"      )
addCatVar(1,    "h",        "Height",                       "m"         )
addCatVar(1,    "Imp",      "Impulse",                      "N*s"       )
addCatVar(1,    "p",        "Momentum",                     "N*s"       )
addCatVar(1,    "Ep",       "Gravity PE",                   "J"         )
addCatVar(1,    "Ek",       "Kinetic energy",               "J"         )
addCatVar(1,    "E",        "Total energy",                 "J"         )
addCatVar(1,    c_th,       "Angle (Degrees)",              utf8(176)   )
addCatVar(1,    "Tp",       "Period",                       "s"         )
addCatVar(1,    "c",        "Circumference",                "m"         )
addCatVar(1,    "r",        "Radius",                       "m"         )


addSubCat(1, 1, "Kinematics", "Solves for: u, v, s, t, a")
aF(1, 1,    "s=((u+v)/2)*t",        U("s", "u", "v", "t")   )
aF(1, 1,    "s=u*t+(1/2)*a*t^(2)",  U("s", "u", "t", "a")   )
aF(1, 1,    "v^(2)=u^(2)+2*a*s",    U("v", "u", "a", "s")   )
aF(1, 1,    "v=u+a*t",              U("v", "u", "a", "t")   )

addSubCat(1, 2, "Force", "")
aF(1, 2,    "F=m*a",    U("F", "m", "a")  )

addSubCat(1, 3, "Impulse", "Solves for: p, Imp, F, t, dv, m, v, u")
aF(1, 3,    "Imp=F*t",          U("Imp", "F", "t")          )
aF(1, 3,    "Imp=m*t",          U("Imp", "m", "t")          )
aF(1, 3,    "p=m*v",            U("p", "m", "v")            )
aF(1, 3,    "F=m*(dv/t)",       U("F", "m", "dv", "t")      )
aF(1, 3,    "F*t=m*dv",         U("F", "t", "m", "dv")      )
aF(1, 3,    "dv=v-u",           U("dv", "v", "u")           )
aF(1, 3,    "F*t=m*v-m*u",      U("F", "t", "m", "v", "u")  )
aF(1, 3,    "p=m*v-m*u",        U("p", "m", "v", "u")       )

addSubCat(1, 4, "Work", "Solves for: W, F, s, m, a, "..c_th)
aF(1, 4,    "W=F*s*cos("..c_th..")",        U("W", "F", c_th, "s")      )
aF(1, 4,    "W=(m*a)*cos("..c_th..")*s",    U("W", "m", "a", c_th, "s") )
aF(1, 4,    "F=m*a",                        U("F", "m", "a")            )
aF(1, 4,    "W=(1/2)*m*(v^(2)-u^(2))",      U("W", "m", "v", "u")       )

addSubCat(1, 5, "Power", "Solves for: P, W, t, F, m, a, s, "..c_th)
aF(1, 5,    "P=W/t",                        U("P", "W", "t")            )
aF(1, 5,    "P=F*v*cos("..c_th..")",        U("P", "F", "v", c_th)      )
aF(1, 5,    "P=F*cos("..c_th..")*(s/t)",    U("P", "F", c_th, "s", "t") )
aF(1, 5,    "W=F*s*cos("..c_th..")",        U("W", "F", "s", c_th)      )
aF(1, 5,    "F=m*a",                        U("F", "m", "a")            )

addSubCat(1, 6, "Energy", "Solves for: Ek, Ep, E, m, v, h, g")
aF(1, 6,    "Ek=(1/2)*m*v^(2)",     U("Ek", "m", "v")           )
aF(1, 6,    "Ek=p^(2)/(2*m)",       U("Ek", "p", "m")           )
aF(1, 6,    "Ep=m*abs(g)*h",        U("Ep", "m", "g", "h")      )
aF(1, 6,    "E=Ek+Ep",              U("E", "Ek", "Ep")          )

addSubCat(1, 7, "Centripital", "Solves for F, a, v, r, Tp (period), m, c" )
aF(1, 7,    "F=(m*v^2)/r",              U( "F", "m", "v", "r" )     )
aF(1, 7,    "a=(4*pi^2*r)/Tp^2",        U( "a", "r", "Tp" )         )
aF(1, 7,    "a=v^2/r^2",                U( "a", "v", "r" )          )
aF(1, 7,    "c=2*π*r",                  U( "c", "r" )               )

addCat(2, "Thermal", "Performs thermal related physics calculations")

addCatVar(2, "P", "Pressure", "Pa")
addCatVar(2, "V", "Volume", "m3")
addCatVar(2, "T", "Tempturature", "K")
addCatVar(2, "n", "Amount", "mol")
addCatVar(2, "m", "Atomic Mass", "kg")
addCatVar(2, "M", "Mass", "kg")
--addCatVar(2, "F", "", "")
--addCatVar(2, "A", "", "")
--addCatVar(2, "Q", "", "")
--addCatVar(2, "c", "", "")
--addCatVar(2, "W", "", "")
--addCatVar(2, "U", "", "")

addSubCat(2, 1, "Thermo", "Solves for P, V, T, n, m, M")
aF(2, 1, "P*V=n*"..Constants["R"].value.."*T", U( "P", "V", "n", "T" ) )
aF(2, 1, "n=m/M", U( "n", "m", "M" ) )

addCat(3, "Oscillations and Waves", "Performs calculations related to oscillations and waves")

--addCatVar(2,    c_om, "", "")
--addCatVar(2,    "T", "", "")
--addCatVar(2,    "x", "", "")
--addCatVar(2,    "v", "", "")
--addCatVar(2,    "u", "", "")
--addCatVar(2,    "t", "", "")
--addCatVar(2,    "Ek", "Kinetic energy", "")
--addCatVar(2,    "Ekm", "Kinetic energy (max)", "")
--addCatVar(2,    "ET", "Thermal energy", "")
--addCatVar(2,    "f", "", "")
--addCatVar(2,    "m", "", "")
--addCatVar(2,    "n", "", "")
--addCatVar(2,    c_la, "", "")
--addCatVar(2,    c_th, "Angle (Degrees)", utf8(176))

addCat(4, "Electric Currents", "Performs electrical related physics calculations")

--addCatVar(2,    "Ve", "", "")
--addCatVar(2,    "m", "", "")
--addCatVar(2,    "v", "", "")
--addCatVar(2,    "I", "", "")
--addCatVar(2,    "q", "", "")
--addCatVar(2,    "t", "", "")
--addCatVar(2,    "R", "", "")
--addCatVar(2,    "P", "", "")
--addCatVar(2,    c_ep, "", "")
--addCatVar(2,    "r", "", "")

addCat(5, "Quantum & Nuclear", "Performs calculations relating to nuclear physics")

--addCatVar(2,    "E", "", "")
--addCatVar(2,    "m", "", "")
--addCatVar(2,    "c", "", "")
--addCatVar(2,    "h", "", "")
--addCatVar(2,    "f", "", "")
--addCatVar(2,    "eV", "", "")
--addCatVar(2,    "n", "", "")
--addCatVar(2,    "x", "", "")
--addCatVar(2,    "p", "", "")
--addCatVar(2,    "A", "", "")
--addCatVar(2,    "N", "", "")
--addCatVar(2,    "t", "", "")
--addCatVar(2,    c_la, "", "")
--addCatVar(2,    "T", "", "")
--addCatVar(2,    "L", "", "")

addCat(6, "Electromagnetism", "Performs calculations relating to electromagnetism")

addCat(7, "Relativity", "Performs calculations relating to relivity")

addCat(8, "Astrophysics", "Performs calculations relating to astrophysics")

addCat(9, "Particle", "Performs calculations relating to particle physics")
