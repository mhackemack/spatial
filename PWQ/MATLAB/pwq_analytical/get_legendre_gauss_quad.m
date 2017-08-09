function [qx, qw] = get_legendre_gauss_quad(n)
switch(n)
    case(1)
        qx = .5;
        qw = 1;
    case(2)
        qx = [  2.11324865405187E-01;
                7.88675134594813E-01];
        qw = [.5;.5];
    case(3)
        qx = [  1.12701665379258E-01
                5.00000000000000E-01
                8.87298334620742E-01];
        qw = [  2.77777777777778E-01
                4.44444444444445E-01
                2.77777777777778E-01];
    case(4)
        qx = [6.94318442029737E-02
                3.30009478207572E-01
                6.69990521792428E-01
                9.30568155797026E-01];
        qw = [1.73927422568727E-01
                3.26072577431273E-01
                3.26072577431273E-01
                1.73927422568727E-01];
    case(5)
        qx = [4.69100770306680E-02
                2.30765344947158E-01
                5.00000000000000E-01
                7.69234655052842E-01
                9.53089922969332E-01];
        qw = [1.18463442528095E-01
                2.39314335249683E-01
                2.84444444444445E-01
                2.39314335249683E-01
                1.18463442528095E-01];
    case(6)
        qx = [3.37652428984240E-02
                1.69395306766868E-01
                3.80690406958402E-01
                6.19309593041599E-01
                8.30604693233132E-01
                9.66234757101576E-01];
        qw = [8.56622461895852E-02
                1.80380786524069E-01
                2.33956967286345E-01
                2.33956967286345E-01
                1.80380786524069E-01
                8.56622461895852E-02];
    case(7)
        qx = [2.54460438286208E-02
                1.29234407200303E-01
                2.97077424311301E-01
                5.00000000000000E-01
                7.02922575688699E-01
                8.70765592799697E-01
                9.74553956171379E-01];
        qw = [6.47424830844348E-02
                1.39852695744638E-01
                1.90915025252560E-01
                2.08979591836735E-01
                1.90915025252560E-01
                1.39852695744638E-01
                6.47424830844348E-02];
    case(8)
        qx = [1.98550717512319E-02
                1.01666761293187E-01
                2.37233795041836E-01
                4.08282678752175E-01
                5.91717321247825E-01
                7.62766204958165E-01
                8.98333238706813E-01
                9.80144928248768E-01];
        qw = [5.06142681451884E-02
                1.11190517226687E-01
                1.56853322938944E-01
                1.81341891689181E-01
                1.81341891689181E-01
                1.56853322938944E-01
                1.11190517226687E-01
                5.06142681451884E-02];
    case(9)
        qx = [1.59198802461870E-02
                8.19844463366821E-02
                1.93314283649705E-01
                3.37873288298096E-01
                5.00000000000000E-01
                6.62126711701905E-01
                8.06685716350295E-01
                9.18015553663318E-01
                9.84080119753813E-01];
        qw = [4.06371941807873E-02
                9.03240803474287E-02
                1.30305348201468E-01
                1.56173538520001E-01
                1.65119677500630E-01
                1.56173538520001E-01
                1.30305348201468E-01
                9.03240803474287E-02
                4.06371941807873E-02];
    case(10)
        qx = [1.30467357414141E-02
                6.74683166555077E-02
                1.60295215850488E-01
                2.83302302935376E-01
                4.25562830509184E-01
                5.74437169490816E-01
                7.16697697064624E-01
                8.39704784149512E-01
                9.32531683344492E-01
                9.86953264258586E-01];
        qw = [3.33356721543440E-02
                7.47256745752903E-02
                1.09543181257991E-01
                1.34633359654998E-01
                1.47762112357377E-01
                1.47762112357377E-01
                1.34633359654998E-01
                1.09543181257991E-01
                7.47256745752903E-02
                3.33356721543440E-02];
    case(11)
        qx = [1.08856709269715E-02
                5.64687001159523E-02
                1.34923997212975E-01
                2.40451935396594E-01
                3.65228422023828E-01
                5.00000000000000E-01
                6.34771577976173E-01
                7.59548064603406E-01
                8.65076002787025E-01
                9.43531299884048E-01
                9.89114329073028E-01];
        qw = [2.78342835580868E-02
                6.27901847324521E-02
                9.31451054638671E-02
                1.16596882295995E-01
                1.31402272255124E-01
                1.36462543388950E-01
                1.31402272255124E-01
                1.16596882295995E-01
                9.31451054638671E-02
                6.27901847324521E-02
                2.78342835580868E-02];
    case(12)
        qx = [9.21968287664038E-03
                4.79413718147626E-02
                1.15048662902848E-01
                2.06341022856691E-01
                3.16084250500910E-01
                4.37383295744266E-01
                5.62616704255734E-01
                6.83915749499090E-01
                7.93658977143309E-01
                8.84951337097152E-01
                9.52058628185238E-01
                9.90780317123360E-01];
        qw = [2.35876681932559E-02
                5.34696629976591E-02
                8.00391642716731E-02
                1.01583713361533E-01
                1.16746268269177E-01
                1.24573522906702E-01
                1.24573522906702E-01
                1.16746268269177E-01
                1.01583713361533E-01
                8.00391642716731E-02
                5.34696629976591E-02
                2.35876681932559E-02];
    case(13)
        qx = [7.90847264070593E-03
                4.12008003885110E-02
                9.92109546333450E-02
                1.78825330279829E-01
                2.75753624481776E-01
                3.84770842022432E-01
                5.00000000000000E-01
                6.15229157977567E-01
                7.24246375518223E-01
                8.21174669720170E-01
                9.00789045366654E-01
                9.58799199611489E-01
                9.92091527359294E-01
                ];
        qw = [2.02420023826579E-02
                4.60607499188642E-02
                6.94367551098936E-02
                8.90729903809729E-02
                1.03908023768444E-01
                1.13141590131448E-01
                1.16275776615437E-01
                1.13141590131448E-01
                1.03908023768444E-01
                8.90729903809729E-02
                6.94367551098936E-02
                4.60607499188642E-02
                2.02420023826579E-02
                ];
    case(14)
        qx = [6.85809565159384E-03
                3.57825581682132E-02
                8.63993424651174E-02
                1.56353547594157E-01
                2.42375681820923E-01
                3.40443815536055E-01
                4.45972525646328E-01
                5.54027474353671E-01
                6.59556184463944E-01
                7.57624318179077E-01
                8.43646452405842E-01
                9.13600657534882E-01
                9.64217441831786E-01
                9.93141904348406E-01
                ];
        qw = [1.75597301658760E-02
                4.00790435798800E-02
                6.07592853439516E-02
                7.86015835790967E-02
                9.27691987389689E-02
                1.02599231860647E-01
                1.07631926731578E-01
                1.07631926731578E-01
                1.02599231860647E-01
                9.27691987389689E-02
                7.86015835790967E-02
                6.07592853439516E-02
                4.00790435798800E-02
                1.75597301658760E-02
                ];
    case(15)
        qx = [6.00374098975731E-03
                3.13633037996470E-02
                7.58967082947864E-02
                1.37791134319915E-01
                2.14513913695730E-01
                3.02924326461218E-01
                3.99402953001282E-01
                5.00000000000000E-01
                6.00597046998717E-01
                6.97075673538781E-01
                7.85486086304269E-01
                8.62208865680085E-01
                9.24103291705213E-01
                9.68636696200353E-01
                9.93996259010242E-01
                ];
        qw = [1.53766209980583E-02
                3.51830237440541E-02
                5.35796102335859E-02
                6.97853389630771E-02
                8.31346029084970E-02
                9.30805000077811E-02
                9.92157426635558E-02
                1.01289120962780E-01
                9.92157426635558E-02
                9.30805000077811E-02
                8.31346029084970E-02
                6.97853389630771E-02
                5.35796102335859E-02
                3.51830237440541E-02
                1.53766209980583E-02
                ];
    case(16)
        qx = [5.29953250417503E-03
                2.77124884633837E-02
                6.71843988060841E-02
                1.22297795822498E-01
                1.91061877798678E-01
                2.70991611171386E-01
                3.59198224610370E-01
                4.52493745081181E-01
                5.47506254918818E-01
                6.40801775389629E-01
                7.29008388828613E-01
                8.08938122201321E-01
                8.77702204177501E-01
                9.32815601193915E-01
                9.72287511536616E-01
                9.94700467495825E-01
                ];
        qw = [1.35762297058770E-02
                3.11267619693238E-02
                4.75792558412464E-02
                6.23144856277669E-02
                7.47979944082884E-02
                8.45782596975012E-02
                9.13017075224617E-02
                9.47253052275342E-02
                9.47253052275342E-02
                9.13017075224617E-02
                8.45782596975012E-02
                7.47979944082884E-02
                6.23144856277669E-02
                4.75792558412464E-02
                3.11267619693238E-02
                1.35762297058770E-02
                ];
    case(17)
        qx = [4.71226234279131E-03
                2.46622391156161E-02
                5.98804231365070E-02
                1.09242998051599E-01
                1.71164420391654E-01
                2.43654731456761E-01
                3.24384118273061E-01
                4.10757909252076E-01
                5.00000000000000E-01
                5.89242090747923E-01
                6.75615881726938E-01
                7.56345268543238E-01
                8.28835579608345E-01
                8.90757001948400E-01
                9.40119576863492E-01
                9.75337760884383E-01
                9.95287737657208E-01
                ];
        qw = [1.20741514342739E-02
                2.77297646869935E-02
                4.25180741585895E-02
                5.59419235967019E-02
                6.75681842342627E-02
                7.70228805384052E-02
                8.40020510782249E-02
                8.82813526834963E-02
                8.97232351781032E-02
                8.82813526834963E-02
                8.40020510782249E-02
                7.70228805384052E-02
                6.75681842342627E-02
                5.59419235967019E-02
                4.25180741585895E-02
                2.77297646869935E-02
                1.20741514342739E-02
                ];
    case(18)
        qx = [4.21741578953455E-03
                2.20880252143011E-02
                5.36987667512220E-02
                9.81475205137384E-02
                1.54156478469823E-01
                2.20114584463026E-01
                2.94124419268578E-01
                3.74056887154247E-01
                4.57612493479132E-01
                5.42387506520867E-01
                6.25943112845752E-01
                7.05875580731421E-01
                7.79885415536973E-01
                8.45843521530176E-01
                9.01852479486261E-01
                9.46301233248777E-01
                9.77911974785698E-01
                9.95782584210465E-01
                ];
        qw = [1.08080067632416E-02
                2.48572744474846E-02
                3.82128651274444E-02
                5.04710220531435E-02
                6.12776033557392E-02
                7.03214573353253E-02
                7.73423375631327E-02
                8.21382418729164E-02
                8.45711914815718E-02
                8.45711914815718E-02
                8.21382418729164E-02
                7.73423375631327E-02
                7.03214573353253E-02
                6.12776033557392E-02
                5.04710220531435E-02
                3.82128651274444E-02
                2.48572744474846E-02
                1.08080067632416E-02
                ];
    case(19)
        qx = [3.79657807820782E-03
                1.98959239325849E-02
                4.84220481925910E-02
                8.86426717314285E-02
                1.39516911332385E-01
                1.99727347669159E-01
                2.67714629312019E-01
                3.41717950018185E-01
                4.19820677179887E-01
                5.00000000000000E-01
                5.80179322820112E-01
                6.58282049981814E-01
                7.32285370687980E-01
                8.00272652330840E-01
                8.60483088667614E-01
                9.11357328268571E-01
                9.51577951807409E-01
                9.80104076067415E-01
                9.96203421921792E-01
                ];
        qw = [9.73089411486321E-03
                2.24071133828497E-02
                3.45222713688205E-02
                4.57450108112249E-02
                5.57833227736670E-02
                6.43769812696681E-02
                7.13033510868033E-02
                7.63830210329298E-02
                7.94844216969772E-02
                8.05272249243918E-02
                7.94844216969772E-02
                7.63830210329298E-02
                7.13033510868033E-02
                6.43769812696681E-02
                5.57833227736670E-02
                4.57450108112249E-02
                3.45222713688205E-02
                2.24071133828497E-02
                9.73089411486321E-03
                ];
    case(20)
        qx = [3.43570040745255E-03
                1.80140363610431E-02
                4.38827858743370E-02
                8.04415140888905E-02
                1.26834046769924E-01
                1.81973159636742E-01
                2.44566499024586E-01
                3.13146955642290E-01
                3.86107074429177E-01
                4.61736739433251E-01
                5.38263260566748E-01
                6.13892925570822E-01
                6.86853044357709E-01
                7.55433500975413E-01
                8.18026840363257E-01
                8.73165953230075E-01
                9.19558485911109E-01
                9.56117214125663E-01
                9.81985963638957E-01
                9.96564299592547E-01
                ];
        qw = [8.80700356957583E-03
                2.03007149001935E-02
                3.13360241670545E-02
                4.16383707883523E-02
                5.09650599086202E-02
                5.90972659807591E-02
                6.58443192245883E-02
                7.10480546591910E-02
                7.45864932363019E-02
                7.63766935653630E-02
                7.63766935653630E-02
                7.45864932363019E-02
                7.10480546591910E-02
                6.58443192245883E-02
                5.90972659807591E-02
                5.09650599086202E-02
                4.16383707883523E-02
                3.13360241670545E-02
                2.03007149001935E-02
                8.80700356957583E-03
                ];
    case(21)
        qx = [3.12391468980521E-03
                1.63865807168468E-02
                3.99503329247995E-02
                7.33183177083413E-02
                1.15780018262161E-01
                1.66430597901293E-01
                2.24190582056390E-01
                2.87828939896280E-01
                3.55989341598799E-01
                4.27219072919552E-01
                5.00000000000000E-01
                5.72780927080447E-01
                6.44010658401200E-01
                7.12171060103719E-01
                7.75809417943609E-01
                8.33569402098706E-01
                8.84219981737838E-01
                9.26681682291658E-01
                9.60049667075200E-01
                9.83613419283153E-01
                9.96876085310194E-01
                ];
        qw = [8.00861412888738E-03
                1.84768948854262E-02
                2.85672127134286E-02
                3.80500568141896E-02
                4.67222117280169E-02
                5.43986495835742E-02
                6.09157080268642E-02
                6.61344693166686E-02
                6.99436973955364E-02
                7.22622019949849E-02
                7.30405668248452E-02
                7.22622019949849E-02
                6.99436973955364E-02
                6.61344693166686E-02
                6.09157080268642E-02
                5.43986495835742E-02
                4.67222117280169E-02
                3.80500568141896E-02
                2.85672127134286E-02
                1.84768948854262E-02
                8.00861412888738E-03
                ];
    case(22)
        qx = [7.31399764913622E-03
                1.68874507924069E-02
                2.61466675763416E-02
                3.48982342122602E-02
                4.29708031085339E-02
                5.02070722214405E-02
                5.64661480402696E-02
                6.16261884052561E-02
                6.55867523935312E-02
                6.82707491730075E-02
                6.96259364278159E-02
                6.96259364278159E-02
                6.82707491730075E-02
                6.55867523935312E-02
                6.16261884052561E-02
                5.64661480402696E-02
                5.02070722214405E-02
                4.29708031085339E-02
                3.48982342122602E-02
                2.61466675763416E-02
                1.68874507924069E-02
                7.31399764913622E-03
                ];
        qw = [2.85270725880038E-03
                1.49697510822856E-02
                3.65216139064130E-02
                6.70937111398499E-02
                1.06091597010395E-01
                1.52756368406658E-01
                2.06179798246544E-01
                2.65322081006621E-01
                3.29032089553957E-01
                3.96069786655889E-01
                4.65130363340138E-01
                5.34869636659861E-01
                6.03930213344110E-01
                6.70967910446042E-01
                7.34677918993378E-01
                7.93820201753455E-01
                8.47243631593341E-01
                8.93908402989604E-01
                9.32906288860150E-01
                9.63478386093586E-01
                9.85030248917714E-01
                9.97147292741199E-01
                ];
    case(23)
        qx = [2.61533250122392E-03
                1.37287643909423E-02
                3.35144565869919E-02
                6.16238208647791E-02
                9.75557991905800E-02
                1.40669318434024E-01
                1.90195062118176E-01
                2.45249261076996E-01
                3.04849480984854E-01
                3.67932159514827E-01
                4.33371587850767E-01
                5.00000000000000E-01
                5.66628412149233E-01
                6.32067840485172E-01
                6.95150519015145E-01
                7.54750738923003E-01
                8.09804937881823E-01
                8.59330681565975E-01
                9.02444200809420E-01
                9.38376179135220E-01
                9.66485543413008E-01
                9.86271235609057E-01
                9.97384667498776E-01
                ];
        qw = [6.70592974357084E-03
                1.54940029284896E-02
                2.40188358655423E-02
                3.21162107042628E-02
                3.96407058883595E-02
                4.64578830300175E-02
                5.24460457322707E-02
                5.74983201112057E-02
                6.15245421533647E-02
                6.44528610940411E-02
                6.62310197023483E-02
                6.68272860930531E-02
                6.62310197023483E-02
                6.44528610940411E-02
                6.15245421533647E-02
                5.74983201112057E-02
                5.24460457322707E-02
                4.64578830300175E-02
                3.96407058883595E-02
                3.21162107042628E-02
                2.40188358655423E-02
                1.54940029284896E-02
                6.70592974357084E-03
                ];
    case(24)
        qx = [2.40639000148934E-03
                1.26357220143452E-02
                3.08627239986336E-02
                5.67922364977994E-02
                8.99990070130485E-02
                1.29937904210722E-01
                1.75953174031512E-01
                2.27289264305580E-01
                2.83103246186977E-01
                3.42478660151918E-01
                4.04440566263191E-01
                4.67971553568697E-01
                5.32028446431302E-01
                5.95559433736808E-01
                6.57521339848081E-01
                7.16896753813022E-01
                7.72710735694419E-01
                8.24046825968487E-01
                8.70062095789277E-01
                9.10000992986951E-01
                9.43207763502200E-01
                9.69137276001366E-01
                9.87364277985654E-01
                9.97593609998510E-01
                ];
        qw = [6.17061489999367E-03
                1.42656943144666E-02
                2.21387194087097E-02
                2.96492924577183E-02
                3.66732407055400E-02
                4.30950807659766E-02
                4.88093260520569E-02
                5.37221350579828E-02
                5.77528340268628E-02
                6.08352364639017E-02
                6.29187281734142E-02
                6.39690976733761E-02
                6.39690976733761E-02
                6.29187281734142E-02
                6.08352364639017E-02
                5.77528340268628E-02
                5.37221350579828E-02
                4.88093260520569E-02
                4.30950807659766E-02
                3.66732407055400E-02
                2.96492924577183E-02
                2.21387194087097E-02
                1.42656943144666E-02
                6.17061489999367E-03
                ];
    otherwise
        [qx, qw] = lgwt(n,0,1);
end