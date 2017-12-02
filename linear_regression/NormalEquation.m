function thetaNorm = NormalEquation(XNormEqn,y)

thetaNorm = pinv((XNormEqn')*XNormEqn)*XNormEqn'*y;