
// If one of the guards is dead
JMPIF (instance_exists(lvm_get('guard1')) and instance_exists(lvm_get('guard2'))) == false -> 2, 1
// Else
JMPIF (true) -> 3, 1

BEGIN 1, 1
{DUMMY}
{DUMMY}
END

    BEGIN 2, 1
    {You really had couldn't restrain yourself from killing! (Richard angry something something)}
    {Yeah.}
    END
    
        BEGIN 3, 1
        {I'll stay in this clearing to do the radio stuff with HQ, you go and scout further.}
        {Okay. [End Dialogue\]} EOP
        END
    
    