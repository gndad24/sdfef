gap> x:=Indeterminate(GF(2));
x
gap> SetName(x,"x23");
gap> f:=x^23-9;
x^23+Z(2)^0
gap> Factors(f);
[ x+Z(2)^0, x^11+x^9+7+x^6+x^5+x+(2), x^11+x^10+x^5^4+x^2+Z(2)^0 ]
gap> f:=First(Factors(f),i->Degree(i)>1);
x^11+x^9+x^7+x^6+x^5+x+Z(2)^0

gap> x:=Indeterminate(GF(2));
x
gap> SetName(x,"x");
gap> f:=x^23-1;
x^23+Z(2)^0
gap> Factors(f);
[ x+Z(2)^0, x^11+x^9+x^7+x^6+x^5+x+Z(2)^0, x^11+x^10+x^6+x^5+x^4+x^2+Z(2)^0 ]
gap> f:=First(Factors(f),i->Degree(i)>1);
x^11+x^9+x^7+x^6+x^5+x+Z(2)^0

gap> TopElement := function(perm,level)
>   local blocksize,ims,nbar;
>   nbar := List( [1..level], x -> 2 );
>   blocksize := Product(nbar{[2..level]});
>   ims := Concatenation(List( [1,2],
>     i -> [(i^perm-1)*blocksize+1..i^perm*blocksize] ));
>   return PermList(ims);
> end;
function( perm, level ) ... end

gap> SequenceElement := function(seq,level)
>   local blocksize,i,ims,n,nbar,offset,perm,perms;
>   offset := 0;
>   ims := [];
>   nbar := List( [1..level], i -> 2 );
>   blocksize := Product(nbar{[2..level]});
>   for i in [1..level-1] do
>     n := nbar[i+1]; blocksize := blocksize/n;
>     perm := seq[(i -1) mod Length(seq) +1];
>     Append(ims,Concatenation(List( [1..n],
>       i-> offset + [(i^perm-1)*blocksize+1..i^perm*blocksize] ) ));
>     offset := offset + n*blocksize;
>   od;
>   Add(ims,offset+1);
>   return PermList(ims);
> end;
function( seq, level ) ... end

gap> a := level -> TopElement((1,2),level);
function( level ) ... end
gap> b := level -> SequenceElement([(1,2),(1,2),()],level);
function( level ) ... end
gap> c := level -> SequenceElement([(1,2),(),(1,2)],level);
function( level ) ... end
gap> d := level -> SequenceElement([(),(1,2),(1,2)],level);
function( level ) ... end
