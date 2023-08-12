function SC =soil_classification(sand, clay)

 if isempty(sand)|isnan(sand)|min(sand)<0
     error('wrong input: sand')
 end
 if isempty(clay)|isnan(clay)|min(clay)<0
     error('wrong input: sand')
 end
 if max(sand)>1
     sand=sand/100;
     warning('sand is >1; ...divided by 100 to get fraction instead of %')
 end
 if max(clay)>1
     clay=clay/100;
     warning('clay is >1; ...divided by 100 to get fraction instead of %')
 end
 if max(sand+clay)>1
    error('data inconsisent: (Clay + Sand)>1')
 end
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
 silt = 1-sand-clay;
 if (silt+1.5*clay)<.15
     SC ='SAND';
 elseif ((silt+1.5*clay)>=.15)&((silt+2*clay)<.3)
     SC ='LOAMY SAND';
 elseif (clay>=0.07) & (clay<=0.2) & (sand>0.52) & ((silt+2*clay)>=0.3) 
     SC ='SANDY LOAM';
 elseif (clay<0.07) & (silt < 0.5) & ((silt+2*clay)>=0.3)
     SC ='SANDY LOAM';
 elseif (clay>=0.07) & (clay<=0.27) & (silt>=0.28) & (silt<0.5) & (sand<=0.52)
     SC ='LOAM';
 elseif ((silt>=0.5) & clay>=0.12 & clay<0.27) | (silt>=0.5 & silt<0.8 & clay<0.12)
     SC ='SILT LOAM';
 elseif silt>=0.8 & clay<0.12
     SC ='SILT';
 elseif clay>=0.2 & clay<0.35 & silt<0.28 & sand>0.45
     SC ='SANDY CLAY LOAM';
 elseif clay>=0.27 & clay <0.4 & sand>0.2 & sand<=0.45
     SC ='CLAY LOAM';
 elseif clay>=0.27 & clay<0.4 & sand<=0.2
     SC ='SILTY CLAY LOAM';
 elseif clay>=0.35 & sand>=0.45
     SC ='SANDY CLAY';
 elseif clay>=0.4 & silt>=0.4
     SC ='SILTY CLAY';
 elseif clay>= 0.4 & sand<=0.45 & silt<0.4
     SC ='CLAY';
 else
     warning('no soil class found')
end
end %of function