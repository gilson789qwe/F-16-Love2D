hc  = require("hc")
function love.load()
    love.window.setMode(640, 320, {fullscreen=false})
    --love.graphics.setBackgroundColor (0,7,9)
    comecou = false
    aceleracao = 100
    velocidade = aceleracao
    destruido = false
    chao = 0
    tempodefinido = 96
    tempo = 0
    pontos = 0

    ceu = love.graphics.newImage("ceu.png")
    ---------------DESERTO--------------------------
    definirdistanciadeserto = 680
    deserto = {}
    deserto.img = love.graphics.newImage("deserto.png")
    deserto.x = 0
    deserto2 = {}
    deserto2.img = love.graphics.newImage("deserto.png")
    deserto2.x = definirdistanciadeserto
    ---------------------------------------------------
    ------------------------JATO-----------------------
    jato = {}
    jato.img = love.graphics.newImage("jato.png")
    jato.x = -320
    jato.y = 0
    jato.l = 120 --largura
    jato.a = 40 -- altura
    rotacao = 5
    jato.r = 0
    jatotemporotacao = 0
    jato.sx = 0.5
    jato.sy = 0.5
    jato.c = hc.rectangle(jato.x,jato.y,jato.l,jato.a)
    jato.explosao1 = {}
    jatomissil = {}
    missil = love.graphics.newImage("missil.png")
    disparou = false
    jatoexplodiu = {}

    sombra = {}
    sombra.img = love.graphics.newImage("sombra.png")
    sombra.x = jato.x
    sombra.y = 280
    sombra.sx = 0.1
    sombra.sy = 0.1
    sombra.r = 0

    turbina = love.audio.newSource("/som/turbina.wav", "static")
    afterbur = love.audio.newSource("/som/AFTERBUR.wav", "static")
    ativadoafterbur = false
    ativadoafterburinicio = 0
    -----------------------Explosao---------------------
    explosao1 = {}
    explosao1.img = love.graphics.newImage("/explosao1/blast002.png")
    explosao1.x = 320
    explosao1.y = 180
    explosao1.sx = 2
    explosao1.sy = 2
    somexplosao = love.audio.newSource("/som/explosao.wav", "static")
    
    exposmig = {}
    exposmix = 0
    exposmiy = 0
    expoceu = true
    somexpmig = love.audio.newSource("/som/explosao.wav", "static")
    ---------------------Mi24--------------------------------
    micreatt = 0
    micreatd = 200
    mitd = 7
    mit = 0
    micriou = {}
    miy =  love.math.random(-20,55)
    mix =  love.math.random(700,1280)
    miimg = love.graphics.newImage("/mi24/mi0.png")
    miimg1 = love.graphics.newImage("/mi24/mi1.png")
    miimg2 = love.graphics.newImage("/mi24/mi2.png")
    miimg3 = love.graphics.newImage("/mi24/mi3.png")

    missilini = {}
    missilinix = 0
    missiliniy = 0
    tempodemissilini = 0
    tempodemissilinid = 5
    -----------------------LANÇAMISSEIS-------------------------------
    lanca = {}
    lancax =  love.math.random(690,800)

    lancaexplodiu = {}
    lancaexplodiux = 0
    lancaexplodiuy = 0
    somexplanca = love.audio.newSource("/som/explosao.wav", "static")

    missilini2 = {}
    missilini2x = 0
    missilini2y = 0
    ------------------------EXPLOSAO--------------------------------
    exp1 = love.graphics.newImage("/explosao2/explo01.png")
    exp2 = love.graphics.newImage("/explosao2/explo02.png")
    exp3 = love.graphics.newImage("/explosao2/explo03.png")
    exp4 = love.graphics.newImage("/explosao2/explo04.png")
    exp5 = love.graphics.newImage("/explosao2/explo05.png")
    exp6 = love.graphics.newImage("/explosao2/explo06.png")
    exp7 = love.graphics.newImage("/explosao2/explo07.png")
    exp8 = love.graphics.newImage("/explosao2/explo08.png")
    exp9 = love.graphics.newImage("/explosao2/explo09.png")
    exp10 = love.graphics.newImage("/explosao2/explo10.png")
    exp11 = love.graphics.newImage("/explosao2/explo11.png")
    exp12 = love.graphics.newImage("/explosao2/explo12.png")
    exp13 = love.graphics.newImage("/explosao2/explo13.png")
    exp14 = love.graphics.newImage("/explosao2/explo14.png")
    exp15 = love.graphics.newImage("/explosao2/explo15.png")
    exp16 = love.graphics.newImage("/explosao2/explo16.png")
    exp17 = love.graphics.newImage("/explosao2/explo17.png")
    exp18 = love.graphics.newImage("/explosao2/explo18.png")
    exp19 = love.graphics.newImage("/explosao2/explo19.png")
    exp20 = love.graphics.newImage("/explosao2/explo20.png")
    exp21 = love.graphics.newImage("/explosao2/explo21.png")
    exp22 = love.graphics.newImage("/explosao2/explo22.png")
    exp23 = love.graphics.newImage("/explosao2/explo23.png")
    exp24 = love.graphics.newImage("/explosao2/explo24.png")
    exp25 = love.graphics.newImage("/explosao2/explo25.png")
    exp26 = love.graphics.newImage("/explosao2/explo26.png")
    exp27 = love.graphics.newImage("/explosao2/explo27.png")
    exp28 = love.graphics.newImage("/explosao2/explo28.png")
    exp29 = love.graphics.newImage("/explosao2/explo29.png")
    exp30 = love.graphics.newImage("/explosao2/explo30.png")
    exp31 = love.graphics.newImage("/explosao2/explo31.png")
    exp32 = love.graphics.newImage("/explosao2/explo32.png")
    exp33 = love.graphics.newImage("/explosao2/explo33.png")
    exp34 = love.graphics.newImage("/explosao2/explo34.png")
    exp35 = love.graphics.newImage("/explosao2/explo35.png")
    exp36 = love.graphics.newImage("/explosao2/explo36.png")
    exp37 = love.graphics.newImage("/explosao2/explo37.png")
    exp38 = love.graphics.newImage("/explosao2/explo38.png")
    exp39 = love.graphics.newImage("/explosao2/explo39.png")
    exp40 = love.graphics.newImage("/explosao2/explo40.png")
    exp41 = love.graphics.newImage("/explosao2/explo41.png")
    exp42 = love.graphics.newImage("/explosao2/explo42.png")
    exp43 = love.graphics.newImage("/explosao2/explo43.png")
    exp44 = love.graphics.newImage("/explosao2/explo44.png")
    exp45 = love.graphics.newImage("/explosao2/explo45.png")
    exp46 = love.graphics.newImage("/explosao2/explo46.png")
    exp47 = love.graphics.newImage("/explosao2/explo47.png")
    exp48 = love.graphics.newImage("/explosao2/explo48.png")
    exp49 = love.graphics.newImage("/explosao2/explo49.png")
    exp50 = love.graphics.newImage("/explosao2/explo50.png")
    expimagem = exp1
    teste = 0
end
function love.draw()

    love.graphics.draw(ceu,0,0)
    ---------------------DESERTO--------------------------
    love.graphics.draw(deserto.img,deserto.x,50,0,0.2,0.2)
    love.graphics.draw(deserto2.img,deserto2.x,50,0,0.2,0.2)

    if comecou == false then 
        love.graphics.print("Aperte letra z para lançar misseis e começar o jogo",120,180)
    end
        --love.graphics.print(deserto.x)x (number), y (number), r (number), sx (number), sy (number), ox (number), oy (number), kx (number), ky (number)
    -------------------------------------------------------
    ------------------------JATO--------------------------
    love.graphics.print("pontos: " ..pontos)
    if love.keyboard.isDown("z") then 
        comecou = true 
    end
    if comecou then 
        if destruido == false then 
            love.graphics.draw(sombra.img,sombra.x,sombra.y,sombra.r,sombra.sx,sombra.sy)
            love.graphics.draw(jato.img,jato.x,jato.y, jato.r,jato.sx,jato.sy)
            --jato.c:draw()
        end
    end
    if chao == 1 and expoceu == false then
        for i, b in ipairs(jato.explosao1) do
            love.graphics.draw(explosao1.img,jato.x,explosao1.y,0,explosao1.sx,explosao1sy)
        end
        table.insert(jato.explosao1, jato.explosao1)
    elseif chao == 2 then 
        table.remove(jato.explosao1,i)
    end
    for i, b in ipairs(jatomissil) do 
        love.graphics.draw(b.img, b.x, b.y, b.r, b.sx, b.sy)
        --b.c:draw()
    end
    ------------------------MI24-----------------------------------
    for i, b in ipairs(micriou) do
        --local teste = (string.format("%s\n", tostring(b.d)))
        --love.graphics.print(teste)
        love.graphics.draw(b.img, b.x, b.y, 0, b.sx, b.sy)
        if mit == 0 or mit == 1 then 
            b.img = miimg
         elseif mit == 2 or mit == 3 then 
            b.img = miimg1
         elseif mit == 4 or mit == 5 then 
            b.img = miimg2
         elseif mit == 6 or mit == 7 then 
            b.img = miimg3
         end
    end
    --love.graphics.draw(expimagem,300,100,0,1,1)
    --------------------EXPLOSAO---------------------------
    for i, b in ipairs(exposmig) do  --mig24
        love.graphics.draw(expimagem, b.x, b.y, 0, b.sx, b.sy)
    end
    for i, b in ipairs(jatoexplodiu) do --
        love.graphics.draw(expimagem, b.x, b.y, 0, b.sx, b.sy)
    end
    for i, b in ipairs(lancaexplodiu) do --
        love.graphics.draw(expimagem, b.x, b.y, 0, b.sx, b.sy)
    end
    -------------------MISSILINIMIGO----------------------
    for i, b in ipairs(missilini) do 
        love.graphics.draw(b.img,b.x,b.y,0,b.sx,b.sy)
        --b.c:draw()
    end
    for i, b in ipairs(missilini2) do 
        love.graphics.draw(b.img,b.x,b.y,b.r,b.sx,b.sy)
        --b.c:draw()
    end
    -----------------------LANCAMISSEIS----------------------
    for i, b in ipairs(lanca)do 
        love.graphics.draw(b.img,b.x,b.y,0,b.sx,b.sy)
    end
end

function love.update(dt)
    -------------------DESERTO----------------------y (number)--------
    deserto.x = deserto.x - velocidade  * dt
    deserto2.x = deserto2.x - velocidade  * dt
    if deserto.x < -definirdistanciadeserto then 
        deserto.x = definirdistanciadeserto
    end
    if deserto2.x < -definirdistanciadeserto then 
        deserto2.x = definirdistanciadeserto
    end
    -----------------JATO------------------------------------
    velocidade = aceleracao
    if jatotemporotacao > 0 then
        jatotemporotacao = jatotemporotacao  -1
    end 
    if jatotemporotacao  == 0 then 
        jato.r = 0
    end
    jato.c:moveTo(jato.x+70,jato.y+40)
    sombra.x = jato.x 
    if comecou  then
        if ativadoafterburinicio == 0 then 
            ativadoafterburinicio = 1
            love.audio.play(afterbur)
        end
        if jato.x < 120 then 
            jato.x = jato.x + (aceleracao*4)*dt
        end
     if jato.x > 120 and destruido == false then 
        love.audio.play(turbina)
        turbina:setVolume(0.5) -- volume do som
        --turbina:setPitch(0.5) -- one octave lower
        if love.keyboard.isDown("right") then 
            turbina:setVolume(0.9)
            velocidade = aceleracao*2
        elseif love.keyboard.isDown("down") then 
             jato.r =  (rotacao*2) *dt 
             jato.y = jato.y + 300 * dt
             jatotemporotacao  = 2
        elseif love.keyboard.isDown("up") and jato.y > 0 then 
            jato.r =  -rotacao *dt 
            jato.y = jato.y - 150 * dt
            jatotemporotacao  = 2
       end
    end
    end
    sombra.r = jato.r
    if destruido == false then 
        if jato.y < 50 then 
            sombra.sx = 0
            sombra.sx = 0
        elseif jato.y > 50 and jato.y < 100 then 
            sombra.sx = 0.1
            sombra.sy = 0.1
        elseif jato.y > 100 and jato.y < 150 then 
            sombra.sx = 0.2
            sombra.sy = 0.2
            sombra.y = 280
        elseif jato.y > 150 and jato.y < 200 then 
            sombra.sx = 0.3
            sombra.sy = 0.3
            sombra.y = 270
        elseif jato.y > 200 and jato.y < 210 then 
            sombra.sx = 0.4
            sombra.sy = 0.4
            sombra.y = 260
        elseif jato.y > 210 and jato.y < 230 then 
            sombra.sx = 0.5
            sombra.sy = 0.5
            sombra.y = 250
        elseif jato.y > 230 then 
            sombra.sx = 0.6
            sombra.sy = 0.6
            sombra.y = 240
        end
        if comecou and jato.x > 120 then 
            if love.keyboard.isDown("z") and disparou == false then 
                table.insert(jatomissil, modelodemissil())
                disparou = true
            end
        end
    end
    if jato.y > 235 and chao ~= 2 then
        destruido = true
        jato.c:moveTo(0,700)
        chao = 1
        expoceu = false
    end
    for i, b in ipairs(jatomissil) do
        b.c:moveTo(b.x+20, b.y+40)
        missilx = b.x
        missily = b.y
        b.x = b.x + (velocidade+500) * dt
        if b.r > 0 then 
            b.y = b.y + 150 * dt
        else 
            b.r = 0
        end 
        if b.x > 640 then 
            disparou = false 
            table.remove(jatomissil, i)
        end
    end
---------------------------Explosao1----------------------------------------------------
    if chao == 1 then 
        love.audio.play(somexplosao)
        turbina:setVolume(0.0)
        if expoceu == false then
            explosao()
        end
    else
        love.audio.stop(somexplosao)
    end
----------------------------------------------------------------------------------------
---------------------------MI24------------------------------------------------------
    if jato.x > 120 then 
     --mi.x = mi.x - velocidade * dt
     if micreatt < micreatd then 
         micreatt = micreatt + 1
      elseif micreatt == micreatd then
          micreatt = 0
      end
    end
    if micreatt == micreatd and #micriou < 1 then
        table.insert(micriou, criandomi())
    end
    for i, ex in ipairs(exposmig) do  -- explsao do mig
        if ex.v == 0 then 
            ex.x =  exposmix-30
            ex.y =  exposmiy-120
        end
        ex.x = ex.x - (velocidade*2) * dt
    end
    for i, b in ipairs(missilini) do  -- missil do mig
        if b.v == 0 then
            b.x = missilinix
            b.y = missiliniy
            b.v = 1
        end
        b.x = b.x - (velocidade*3)*dt
        if b.x < -100 then
            table.remove(missilini, i)
        end
    end
    animacaoexplosaoceu()
    for i, b in ipairs(micriou) do
        b.c:moveTo(b.x+70, b.y+50)
        b.x = b.x - (velocidade+50) * dt

        if b.x < 620 and b.x > 200  then  -- gerando missil no mig-24
            if tempodemissilini == 0 then 
                missilinix = b.x + 30
                missiliniy = b.y+70
                if #missilini < 1  then
                    table.insert(missilini,missilinimigo())
                end
            end
        end

        if b.x < -200 then 
            table.remove(micriou, i)
            --micriou[i] = nil; apagara a tabela
        end
        for i, missil  in ipairs(jatomissil) do 
            --  if checkcolisao(mig.x, mig.y,mig.c:getWidth(),mig.c:getHeight(),missil.x, missil.y,missil.c:getWidth(),missil.c:getHeight()) then
            if checkcolisao(b.x, b.y,b.l,b.a,missil.x, missil.y,missil.l,missil.a) then
                exposmix = b.x
                exposmiy = b.y
                table.insert(exposmig, explosaoceu())
                table.remove(micriou, i)
                table.remove(jatomissil, i)
                disparou = false
                pontos = pontos +10
            end
        end
    end
    miy = love.math.random(-20,45)
    mix = love.math.random(1000,1280)

    if mit < mitd then 
        mit = mit + 1 
    elseif mit == mitd then 
     mit = 0
    end
    if tempodemissilini < tempodemissilinid then
        tempodemissilini = tempodemissilini + 1
    elseif tempodemissilini == tempodemissilinid then 
        tempodemissilini = 0
    end
    -------------------------------LANCAMISSEIS-----------------------------  
   
    for i, m in ipairs(missilini2) do -- missil do lanca
         m.x = m.x - (velocidade+70)*dt
         m.y = m.y - 110 *dt
    end
    for i, b in ipairs(lanca)do 
        b.x = b.x - velocidade * dt
        if b.x < -100 then 
            table.remove(lanca, i)
        end
        if b.x < 620 and b.x > 200 and destruido == false  then 
            if tempodemissilini == 0  then
                missilinix2 = b.x 
                missiliniy2 = b.y 
                if #missilini2 < 1  then
                    table.insert(missilini2,missilinimigo())    
               end
            end
        end
        for i, m in ipairs(missilini2) do  -- missil do lanca
            if m.v == 0 then 
                m.x = missilinix2
                m.y = missiliniy2
                m.v = 1
            end
            if m.y < -10 then 
               table.remove(missilini2, i) 
            end
        end
        for i, missil  in ipairs(jatomissil) do 
            --  if checkcolisao(mig.x, mig.y,mig.c:getWidth(),mig.c:getHeight(),missil.x, missil.y,missil.c:getWidth(),missil.c:getHeight()) then
            if checkcolisao(b.x, b.y,b.img:getWidth()*b.sx,b.img:getHeight()*b.sy,missil.x, missil.y,missil.l,missil.a) then
                lancaexplodiux = b.x 
                lancaexplodiuy = b.y 
                table.insert(lancaexplodiu, explosaoceu())
                table.remove(lanca, i)
                table.remove(jatomissil, i)
                disparou = false
                pontos = pontos +100
            end
        end
    end
    if micreatt == micreatd and #lanca < 1 then 
        table.insert(lanca,lancamisseis())
    end
end
---------------------------------EXPLOSAO-------------------------------
function animacaoexplosaoceu()
    for i, b in ipairs(exposmig) do --mig24
        if b.v < 51 then
          b.v = b.v + 1
          love.audio.play(somexpmig)
        end
        if b.v == 1 then 
          expimagem = exp1 
        elseif b.v == 2 then
         expimagem = exp2
        elseif b.v == 3 then
            expimagem = exp3
        elseif b.v == 4 then
            expimagem = exp4
        elseif b.v == 5 then
            expimagem = exp5
        elseif b.v == 6 then
            expimagem = exp6
        elseif b.v == 7 then
            expimagem = exp7
        elseif b.v == 8 then
            expimagem = exp8
        elseif b.v == 9 then
            expimagem = exp9
        elseif b.v == 10 then
            expimagem = exp10
        elseif b.v == 11 then
            expimagem = exp11
        elseif b.v == 12 then
            expimagem = exp12
        elseif b.v == 13 then
            expimagem = exp13
        elseif b.v == 14 then
            expimagem = exp14
        elseif b.v == 15 then
            expimagem = exp15
        elseif b.v == 16 then
            expimagem = exp16
        elseif b.v == 17 then
            expimagem = exp17
        elseif b.v == 18 then
            expimagem = exp18
        elseif b.v == 19 then
            expimagem = exp19
        elseif b.v == 20 then
            expimagem = exp20
        elseif b.v == 21 then
            expimagem = exp21
        elseif b.v == 22 then
            expimagem = exp22
        elseif b.v == 23 then
            expimagem = exp23
        elseif b.v == 24 then
            expimagem = exp24
        elseif b.v == 25 then
            expimagem = exp25
        elseif b.v == 26 then
            expimagem = exp26
        elseif b.v == 27 then
            expimagem = exp27
        elseif b.v == 28 then
            expimagem = exp28
        elseif b.v == 29 then
            expimagem = exp29
        elseif b.v == 30 then
            expimagem = exp30
        elseif b.v == 31 then
            expimagem = exp31
        elseif b.v == 32 then
            expimagem = exp32
        elseif b.v == 33 then
            expimagem = exp33
        elseif b.v == 34 then
            expimagem = exp34
        elseif b.v == 35 then
            expimagem = exp35
        elseif b.v == 36 then
            expimagem = exp36
        elseif b.v == 37 then
            expimagem = exp37
        elseif b.v == 38 then
            expimagem = exp38
        elseif b.v == 39 then
            expimagem = exp39
        elseif b.v == 40 then
            expimagem = exp40
        elseif b.v == 41 then
            expimagem = exp41
        elseif b.v == 42 then
            expimagem = exp42
        elseif b.v == 43 then
            expimagem = exp43
        elseif b.v == 44 then
            expimagem = exp44
        elseif b.v == 45 then
            expimagem = exp45
        elseif b.v == 46 then
            expimagem = exp46
        elseif b.v == 47 then
            expimagem = exp47
        elseif b.v == 48 then
            expimagem = exp48
        elseif b.v == 49 then
            expimagem = exp49
        elseif b.v == 50 then
            expimagem = exp50
        elseif b.v == 51 then
            love.audio.stop(somexpmig)
            table.remove(exposmig,i)
        end 
    end
    for i, b in ipairs(jatoexplodiu) do --jato
        if b.v == 0 then 
            chao = 1
            b.x = jato.x - 50
            b.y = jato.y - 120
        end
        if b.v < 51 then
          b.v = b.v + 1
        end
        if b.v == 1 then 
          expimagem = exp1 
        elseif b.v == 2 then
         expimagem = exp2
        elseif b.v == 3 then
            expimagem = exp3
        elseif b.v == 4 then
            expimagem = exp4
        elseif b.v == 5 then
            expimagem = exp5
        elseif b.v == 6 then
            expimagem = exp6
        elseif b.v == 7 then
            expimagem = exp7
        elseif b.v == 8 then
            expimagem = exp8
        elseif b.v == 9 then
            expimagem = exp9
        elseif b.v == 10 then
            expimagem = exp10
        elseif b.v == 11 then
            expimagem = exp11
        elseif b.v == 12 then
            expimagem = exp12
        elseif b.v == 13 then
            expimagem = exp13
        elseif b.v == 14 then
            expimagem = exp14
        elseif b.v == 15 then
            expimagem = exp15
        elseif b.v == 16 then
            expimagem = exp16
        elseif b.v == 17 then
            expimagem = exp17
        elseif b.v == 18 then
            expimagem = exp18
        elseif b.v == 19 then
            expimagem = exp19
        elseif b.v == 20 then
            expimagem = exp20
        elseif b.v == 21 then
            expimagem = exp21
        elseif b.v == 22 then
            expimagem = exp22
        elseif b.v == 23 then
            expimagem = exp23
        elseif b.v == 24 then
            expimagem = exp24
        elseif b.v == 25 then
            expimagem = exp25
        elseif b.v == 26 then
            expimagem = exp26
        elseif b.v == 27 then
            expimagem = exp27
        elseif b.v == 28 then
            expimagem = exp28
        elseif b.v == 29 then
            expimagem = exp29
        elseif b.v == 30 then
            expimagem = exp30
        elseif b.v == 31 then
            expimagem = exp31
        elseif b.v == 32 then
            expimagem = exp32
        elseif b.v == 33 then
            expimagem = exp33
        elseif b.v == 34 then
            expimagem = exp34
        elseif b.v == 35 then
            expimagem = exp35
        elseif b.v == 36 then
            expimagem = exp36
        elseif b.v == 37 then
            expimagem = exp37
        elseif b.v == 38 then
            expimagem = exp38
        elseif b.v == 39 then
            expimagem = exp39
        elseif b.v == 40 then
            expimagem = exp40
        elseif b.v == 41 then
            expimagem = exp41
        elseif b.v == 42 then
            expimagem = exp42
        elseif b.v == 43 then
            expimagem = exp43
        elseif b.v == 44 then
            expimagem = exp44
        elseif b.v == 45 then
            expimagem = exp45
        elseif b.v == 46 then
            expimagem = exp46
        elseif b.v == 47 then
            expimagem = exp47
        elseif b.v == 48 then
            expimagem = exp48
        elseif b.v == 49 then
            expimagem = exp49
        elseif b.v == 50 then
            expimagem = exp50
        elseif b.v == 51 then
            love.load()
        end
    end
    for i, b in ipairs(lancaexplodiu) do --jato
        if b.v == 0 then 
            b.x = lancaexplodiux - 150
            b.y = lancaexplodiuy - 150
        end
        if b.v < 51 then
          b.v = b.v + 1
          love.audio.play(somexplanca)
        end
        if b.v == 1 then 
          expimagem = exp1 
        elseif b.v == 2 then
         expimagem = exp2
        elseif b.v == 3 then
            expimagem = exp3
        elseif b.v == 4 then
            expimagem = exp4
        elseif b.v == 5 then
            expimagem = exp5
        elseif b.v == 6 then
            expimagem = exp6
        elseif b.v == 7 then
            expimagem = exp7
        elseif b.v == 8 then
            expimagem = exp8
        elseif b.v == 9 then
            expimagem = exp9
        elseif b.v == 10 then
            expimagem = exp10
        elseif b.v == 11 then
            expimagem = exp11
        elseif b.v == 12 then
            expimagem = exp12
        elseif b.v == 13 then
            expimagem = exp13
        elseif b.v == 14 then
            expimagem = exp14
        elseif b.v == 15 then
            expimagem = exp15
        elseif b.v == 16 then
            expimagem = exp16
        elseif b.v == 17 then
            expimagem = exp17
        elseif b.v == 18 then
            expimagem = exp18
        elseif b.v == 19 then
            expimagem = exp19
        elseif b.v == 20 then
            expimagem = exp20
        elseif b.v == 21 then
            expimagem = exp21
        elseif b.v == 22 then
            expimagem = exp22
        elseif b.v == 23 then
            expimagem = exp23
        elseif b.v == 24 then
            expimagem = exp24
        elseif b.v == 25 then
            expimagem = exp25
        elseif b.v == 26 then
            expimagem = exp26
        elseif b.v == 27 then
            expimagem = exp27
        elseif b.v == 28 then
            expimagem = exp28
        elseif b.v == 29 then
            expimagem = exp29
        elseif b.v == 30 then
            expimagem = exp30
        elseif b.v == 31 then
            expimagem = exp31
        elseif b.v == 32 then
            expimagem = exp32
        elseif b.v == 33 then
            expimagem = exp33
        elseif b.v == 34 then
            expimagem = exp34
        elseif b.v == 35 then
            expimagem = exp35
        elseif b.v == 36 then
            expimagem = exp36
        elseif b.v == 37 then
            expimagem = exp37
        elseif b.v == 38 then
            expimagem = exp38
        elseif b.v == 39 then
            expimagem = exp39
        elseif b.v == 40 then
            expimagem = exp40
        elseif b.v == 41 then
            expimagem = exp41
        elseif b.v == 42 then
            expimagem = exp42
        elseif b.v == 43 then
            expimagem = exp43
        elseif b.v == 44 then
            expimagem = exp44
        elseif b.v == 45 then
            expimagem = exp45
        elseif b.v == 46 then
            expimagem = exp46
        elseif b.v == 47 then
            expimagem = exp47
        elseif b.v == 48 then
            expimagem = exp48
        elseif b.v == 49 then
            expimagem = exp49
        elseif b.v == 50 then
            expimagem = exp50
        elseif b.v == 51 then
            love.audio.stop(somexplanca)
            table.remove(lancaexplodiu,i)
        end
    end
    for i, b in ipairs(micriou) do
        if checkcolisao(jato.x,jato.y,jato.l,jato.a,b.x,b.y,b.l,b.a) then -- colisao de jato e mig
            destruido = true
            table.remove(micriou, i)
         if destruido then 
              if #jatoexplodiu < 1 then
                table.insert(jatoexplodiu,explosaoceu())
             end
            end
        end
    end
    for i, b in ipairs(missilini) do
        if checkcolisao(jato.x,jato.y,jato.l,jato.a,b.x,b.y,b.img:getWidth()*b.sx,b.img:getHeight()*b.sy) then -- colisao de jato e mig
            destruido = true
            table.remove(missilini, i)
         if destruido then 
              if #jatoexplodiu < 1 then
                table.insert(jatoexplodiu,explosaoceu())
             end
            end
        end
    end
    for i, b in ipairs(missilini2) do
        if checkcolisao(jato.x,jato.y,jato.l,jato.a,b.x,b.y,b.img:getWidth()*b.sx,b.img:getHeight()*b.sy) then -- colisao de jato e mig
            destruido = true
            table.remove(missilini2, i)
         if destruido then 
              if #jatoexplodiu < 1 then
                table.insert(jatoexplodiu,explosaoceu())
             end
            end
        end
    end
end

function explosao()
   if tempo < tempodefinido then 
    tempo = tempo + 2
   end

   if  tempo < 10 then
    explosao1.img = love.graphics.newImage("/explosao1/blast002.png")
   elseif tempo == 12 then
    explosao1.img = love.graphics.newImage("/explosao1/blast003.png")
   elseif tempo == 14 then
    explosao1.img = love.graphics.newImage("/explosao1/blast004.png")
   elseif tempo == 16 then
    explosao1.img = love.graphics.newImage("/explosao1/blast005.png")
   elseif tempo == 18 then
    explosao1.img = love.graphics.newImage("/explosao1/blast006.png")
   elseif tempo == 20 then
    explosao1.img = love.graphics.newImage("/explosao1/blast007.png")
   elseif tempo == 22 then
    explosao1.img = love.graphics.newImage("/explosao1/blast008.png")
   elseif tempo == 24 then
    explosao1.img = love.graphics.newImage("/explosao1/blast009.png")
   elseif tempo == 26 then
    explosao1.img = love.graphics.newImage("/explosao1/blast010.png")
   elseif tempo == 28 then
    explosao1.img = love.graphics.newImage("/explosao1/blast011.png")
   elseif  tempo == 30 then
    explosao1.img = love.graphics.newImage("/explosao1/blast012.png")
   elseif tempo == 32 then
    explosao1.img = love.graphics.newImage("/explosao1/blast013.png")
   elseif tempo == 34 then
    explosao1.img = love.graphics.newImage("/explosao1/blast014.png")
   elseif tempo == 36 then
    explosao1.img = love.graphics.newImage("/explosao1/blast015.png")
   elseif tempo == 38 then
    explosao1.img = love.graphics.newImage("/explosao1/blast016.png")
   elseif tempo == 40 then
    explosao1.img = love.graphics.newImage("/explosao1/blast017.png")
   elseif tempo == 42 then
    explosao1.img = love.graphics.newImage("/explosao1/blast018.png")
   elseif tempo == 44 then
    explosao1.img = love.graphics.newImage("/explosao1/blast019.png")
   elseif tempo == 46 then
    explosao1.img = love.graphics.newImage("/explosao1/blast020.png")
   elseif tempo == 48 then
    explosao1.img = love.graphics.newImage("/explosao1/blast021.png")
   elseif  tempo == 50 then
    explosao1.img = love.graphics.newImage("/explosao1/blast022.png")
   elseif tempo == 52 then
    explosao1.img = love.graphics.newImage("/explosao1/blast023.png")
   elseif tempo == 54 then
    explosao1.img = love.graphics.newImage("/explosao1/blast024.png")
   elseif tempo == 56 then
    explosao1.img = love.graphics.newImage("/explosao1/blast025.png")
   elseif tempo == 58 then
    explosao1.img = love.graphics.newImage("/explosao1/blast026.png")
   elseif tempo == 60 then
    explosao1.img = love.graphics.newImage("/explosao1/blast027.png")
   elseif tempo == 62 then
    explosao1.img = love.graphics.newImage("/explosao1/blast028.png")
   elseif tempo == 64 then
    explosao1.img = love.graphics.newImage("/explosao1/blast029.png")
   elseif tempo == 66 then
    explosao1.img = love.graphics.newImage("/explosao1/blast030.png")
   elseif tempo == 68 then
    explosao1.img = love.graphics.newImage("/explosao1/blast032.png")
    elseif  tempo == 70 then
    explosao1.img = love.graphics.newImage("/explosao1/blast034.png")
   elseif tempo == 72 then
    explosao1.img = love.graphics.newImage("/explosao1/blast035.png")
   elseif tempo == 74 then
    explosao1.img = love.graphics.newImage("/explosao1/blast036.png")
   elseif tempo == 76 then
    explosao1.img = love.graphics.newImage("/explosao1/blast037.png")
   elseif tempo == 78 then
    explosao1.img = love.graphics.newImage("/explosao1/blast038.png")
   elseif tempo == 80 then
    explosao1.img = love.graphics.newImage("/explosao1/blast039.png")
   elseif tempo == 82 then
    explosao1.img = love.graphics.newImage("/explosao1/blast040.png")
   elseif tempo == 84 then
    explosao1.img = love.graphics.newImage("/explosao1/blast041.png")
   elseif tempo == 86 then
    explosao1.img = love.graphics.newImage("/explosao1/blast042.png")
   elseif tempo == 88 then
    explosao1.img = love.graphics.newImage("/explosao1/blast043.png")
   elseif tempo == 90 then
    explosao1.img = love.graphics.newImage("/explosao1/blast044.png")
   elseif tempo == 92 then
    explosao1.img = love.graphics.newImage("/explosao1/blast045.png")
   elseif tempo == 94 then
    explosao1.img = love.graphics.newImage("/explosao1/blast046.png")
   elseif tempo == 96 then
    explosao1.img = love.graphics.newImage("/explosao1/blast046.png")
    chao = 2
    love.load()
   end
end


function criandomi()
    local mi = {}
    mi.img = miimg
    mi.x = mix
    mi.y = miy
    mi.l = 120 --largura do mi.c
    mi.a = 50 --largura do mi.c
    mi.sx = 0.7
    mi.sy = 0.7
    mi.c = hc.rectangle(mi.x,mi.y,mi.l,mi.a)
    return mi
end

function modelodemissil()
    local mis = {}
    mis.img = missil
    mis.x = jato.x+50
    mis.y = jato.y+20
    mis.r = jato.r*2
    mis.l = 30
    mis.a = 10
    mis.sx = 0.2
    mis.sy = 0.2
    mis.c = hc.rectangle(mis.x,mis.y,mis.l,mis.a)
    return mis
    
end

function love.keyreleased(key)
    --if key == "z" then 
     --   disparou = false 
    --end
   -- if key == "up" then 
   --     jato.r = 0
   -- elseif key == "down" then
   --     jato.r = 0
   -- end
end
function explosaoceu()
    local expmolde = {}
        expmolde.img = expimagem
        expmolde.v = 0
        if expmolde.v == 0 then
            expmolde.x = 0
            expmolde.y = 0
        end
        expmolde.sx = 1.5
        expmolde.sy = 1.5
    return expmolde
end
function checkcolisao(x1,y1,w1,h1,x2,y2,w2,h2)
    return x1 < x2 + w2 and x2 < x1 + w1 and y1 < y2 + h2 and y2 < y1 + h1
end

function missilinimigo()
    local m = {}
    m.img = love.graphics.newImage("missilini.png")
    m.x = 300
    m.y = 200
    m.r = -100
    m.sx = 0.2
    m.sy = 0.2
    m.v = 0
    --m.c = hc.rectangle(m.x,m.y,m.img:getWidth()*m.sx,m.img:getHeight()*m.sy)
    return m 
end

function lancamisseis()
    local l = {}
    l.img = love.graphics.newImage("lanca.png")
    l.x = lancax 
    l.y = 250
    l.sx = 0.15
    l.sy = 0.15
    l.v = 0
    return l
end