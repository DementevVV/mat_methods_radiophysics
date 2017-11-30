function thetaNorm = NormalEquation(XNormEqn,y)

thetaNormEqn = pinv((XNormEqn')*XNormEqn)*XNormEqn'*y;