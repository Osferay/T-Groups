#####################################################
### Returns true if is less or equal in the order ###
### 0 << 1 << ... << -1 << ...                    ###
#####################################################
IntegerOrder := function(a,b)
    if a = 0 then
        return true;
    elif b = 0 then
        return false;
    elif a > 0 then
        if b < 0 then
            return true;
        else
            return a <= b;
        fi;
    else
        if b > 0 then
            return false;
        else
            return b <= a;
        fi;
    fi;
end;   

#####################################################
### Returns true if is less or equal in the order ###
### extended to the exponents of g and h          ###
#####################################################

ExponentOrder := function(g,h)
    local   e1,
            e2,
            i;

    e1  := Exponents(g);
    e2  := Exponents(h);

    for i in [1..Length(e1)] do
        if e1[i] <> e2[i] then
            return IntegerOrder( e1[i], e2[i] );
        fi;
    od;
    return true;
end;

#####################################################
### Returns true if g <<= h                       ###
#####################################################

InstallGlobalFunction( "ConjugacyOrder" , function(g,h) 

    local   fam,ord;

    fam := FamilyObj( g );
    ord := OrderingByLessThanFunctionNC(fam, ExponentOrder);

    return IsLessThanUnder(ord, g, h);

end );