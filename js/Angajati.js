// Angajati.js
var ar = new Array(33, 34, 35, 36, 37, 38, 39, 40);

$(document).keydown(function (e) {
    var key = e.which;
    //console.log(key);
    //if(key==35 || key == 36 || key == 37 || key == 39)
    if ($.inArray(key, ar) > -1) {
        e.preventDefault();
        return false;
    }
    return true;
});

function Lista(Find)  
{
    $get('up').style.display = '';
    var oFiltruAngajati = new WbmOlimpias.FiltruAngajatiObiect();
    oFiltruAngajati.Find = Find;
    oFiltruAngajati.FiltruCodAngajat = $get("tbFiltruCodAngajat").value;
    oFiltruAngajati.FiltruCodSistem = $get("tbFiltruCodSistem").value;
    oFiltruAngajati.FiltruMarca = $get("tbFiltruMarca").value;
    oFiltruAngajati.FiltruNume = $get("tbFiltruNume").value;
    oFiltruAngajati.FiltruDepartament = $get("tbFiltruDepartament").value;
    oFiltruAngajati.FiltruEchipa = $get("tbFiltruEchipa").value;
    oFiltruAngajati.FiltruLinie = $get("tbFiltruLinie").value;
    WbmOlimpias.AngajatiWS.AngajatiLista(oFiltruAngajati, $get("tbPaginaCurenta").value, SucceededCallback, FailedCallback);

    var showModalDialogHandler = function (callback) {
        this.modalDialogEmulator = null;
        this.callBack = callback;
        this.returnImmediately = false;
        this.modalDialog = false;
        this.maxRuns = 180;
        this.intervall = 750;
        this.force = false;             // if set to true, emulate always.
        this.chrome = navigator.userAgent.toLowerCase().indexOf('chrome') > -1;

        this.callModalDialog = function (url, arg, feature) {
            var self = this;

            if (!this.force && window.showModalDialog)
                this.modalDialog = window.showModalDialog(url, arg, feature);
            else {
                this.modalDialog = this.modalDialogEmulator(url, arg, feature);
                window.setTimeout(function () {
                    self.modalDialog.focus();
                }, 20);


                jQuery(window).bind("focus", function () {
                    //console.log("opener focus");
                    if (self.chrome) {
                        // brute force: close and reopen, hope it will cope with that !!!
                        if (!self.modalDialog.closed) {
                            self.modalDialog.close();
                            self.modalDialog = self.modalDialogEmulator(url, arg, feature);
                        }
                    }
                    else {
                        if (!self.modalDialog.closed) {
                            window.setTimeout(function () {
                                self.modalDialog.blur();
                                self.modalDialog.focus();
                            }, 30);
                        }
                        else {
                            jQuery(window).unbind("focus"); // remove that listener, cpu-sucker.
                        }
                    }
                });
            }

            if (this.returnImmediately) {
                var runs = this.maxRuns;
                var loop = setInterval(function () {
                    if (self.modalDialog.closed) {
                        //console.log("close catched, callback:");
                        clearInterval(loop);
                        self.callBack();
                    }
                    if (runs-- <= 0)
                        clearInterval(loop); // infinitystopper
                }, this.intervall);
                return false;
            }
            else
                return this.modalDialog;

        };

        /*
         * showModalDialog is not longer supported, emulate with popup and
         * a catcher with returnImmediately
         */
        if (this.force || !window.showModalDialog) {
            var self = this;
            this.modalDialogEmulator = function (url, arg, feature) {
                // console.log("window.ShowModalDialog not supported");
                self.returnImmediately = true;
                var opFeature = feature.split(";");
                var featuresArray = new Array()
                if (document.all) {
                    for (var i = 0; i < opFeature.length - 1; i++) {
                        var f = opFeature[i].split("=");
                        featuresArray[f[0]] = f[1];
                    }
                }
                else {
                    for (var i = 0; i < opFeature.length - 1; i++) {
                        var f = opFeature[i].split(":");
                        featuresArray[f[0].toString().trim().toLowerCase()] = f[1].toString().trim();
                    }
                }

                var h = "200px", w = "400px", l = "100px", t = "100px", r = "yes", c = "yes", s = "no";
                if (featuresArray["dialogheight"]) h = featuresArray["dialogheight"];
                if (featuresArray["dialogwidth"]) w = featuresArray["dialogwidth"];
                if (featuresArray["dialogleft"]) l = featuresArray["dialogleft"];
                if (featuresArray["dialogtop"]) t = featuresArray["dialogtop"];
                if (featuresArray["resizable"]) r = featuresArray["resizable"];
                if (featuresArray["center"]) c = featuresArray["center"];
                if (featuresArray["status"]) s = featuresArray["status"];
                var modelFeature = "height = " + h + ",width = " + w + ",left=" + l + ",top=" + t
                    + ",model=yes,alwaysRaised=yes" + ",resizable= " + r + ",center=" + c
                    + ",dependent=yes,dialog=yes,modal=yes,close=0"
                    + ",status=" + s;

                var model = window.open(url, "modal", modelFeature, null);
                return model;
            };
        }

    }
}
function Proprietati() {
    var Id = $get("hfId").value;
    if (Id == '') {
        $get("tbCodAngajat").focus();
        $get("tbCodAngajat").value = "";
        $get("tbCodSistem").value = "";
        $get("tbMarca").value = "";
        $get("tbNume").value = "";
        $get("tbPrenume").value = "";
        $get("tbStrada").value = "";
        $get("hfIdLocalitate").value = "";
        $get("tbLocalitate").value = "";
        $get("tbDataNasterii").value = "";
        $get("tbSomaj").value = "";
        $get("tbDataAngajarii").value = "";
        $get("tbDataNedeterminat").value = "";
        $get("hfIdTipPostDeLucru").value = "";
        $get("tbTipPostDeLucru").value = "";
        $get("tbDataExpirareContract").value = "";
        $get("tbDataExpirareProba").value = "";
        $get("hfIdIntervalDeLucru").value = "";
        $get("tbIntervalDeLucru").value = "";
        $get("hfIdPostDeLucru").value = "";
        $get("tbPostDeLucru").value = "";
        $get("tbSex").value = "";
        $get("hfIdLoculNasterii").value = "";
        $get("tbLoculNasterii").value = "";
        $get("tbNumarIdentificarePersonala").value = "";
        $get("hfIdIncadrare").value = "";
        $get("tbIncadrare").value = "";
        $get("hfIdNivelStudiu").value = "";
        $get("tbNivelStudiu").value = "";
        $get("hfIdBanca").value = "";
        $get("tbBanca").value = "";
        $get("tbStareCivila").value = "";
        $get("tbNumarTelefon").value = "";
        $get("tbCC").value = "";
        $get("hfIdDepartament").value = "";
        $get("tbDepartament").value = "";
        $get("hfIdEchipa").value = "";
        $get("tbEchipa").value = "";
        $get("tbAdresaEmail").value = "";
        $get("hfIdLinie").value = "";
        $get("tbLinie").value = "";
        $get("tbDataLichidarii").value = "";
        $get("tbDataMaternitate").value = "";
    }
    else {
        $get('up').style.display = '';
        WbmOlimpias.AngajatiWS.AngajatProprietati(Id, SucceededCallback, FailedCallback);
    }
}
function Adaugare() {
    $get('up').style.display = '';
    var oAngajat = new WbmOlimpias.AngajatObiect();
    oAngajat.Id = '';

    oAngajat.CodAngajat = $get("tbCodAngajat").value;
    oAngajat.CodSistem = $get("tbCodSistem").value;
    oAngajat.Marca = $get("tbMarca").value;
    oAngajat.Nume = $get("tbNume").value;
    oAngajat.Prenume = $get("tbPrenume").value;
    oAngajat.Strada = $get("tbStrada").value;

    var oLocalitate = new WbmOlimpias.LocalitateObiect();
    oLocalitate.Id = $get("hfIdLocalitate").value;
    oAngajat.oLocalitate = oLocalitate;

    oAngajat.DataNasterii = $get("tbDataNasterii").value;
    oAngajat.Somaj = $get("tbSomaj").value;
    oAngajat.DataAngajarii = $get("tbDataAngajarii").value;
    oAngajat.DataNedeterminat = $get("tbDataNedeterminat").value;

    var oTipPostDeLucru = new WbmOlimpias.TipPostDeLucruObiect();
    oTipPostDeLucru.Id = $get("hfIdTipPostDeLucru").value;
    oAngajat.oTipPostDeLucru = oTipPostDeLucru;

    oAngajat.DataExpirareContract = $get("tbDataExpirareContract").value;
    oAngajat.DataExpirareProba = $get("tbDataExpirareProba").value;

    var oIntervalDeLucru = new WbmOlimpias.IntervalDeLucruObiect();
    oIntervalDeLucru.Id = $get("hfIdIntervalDeLucru").value;
    oAngajat.oIntervalDeLucru = oIntervalDeLucru;

    var oPostDeLucru = new WbmOlimpias.PostDeLucruObiect();
    oPostDeLucru.Id = $get("hfIdPostDeLucru").value;
    oAngajat.oPostDeLucru = oPostDeLucru;

    oAngajat.Sex = $get("tbSex").value;

    var oLoculNasterii = new WbmOlimpias.LocalitateObiect();
    oLoculNasterii.Id = $get("hfIdLoculNasterii").value;
    oAngajat.oLoculNasterii = oLoculNasterii;

    oAngajat.NumarIdentificarePersonala = $get("tbNumarIdentificarePersonala").value;

    var oIncadrare = new WbmOlimpias.IncadrareObiect();
    oIncadrare.Id = $get("hfIdIncadrare").value;
    oAngajat.oIncadrare = oIncadrare;

    var oNivelStudiu = new WbmOlimpias.NivelStudiuObiect();
    oNivelStudiu.Id = $get("hfIdNivelStudiu").value;
    oAngajat.oNivelStudiu = oNivelStudiu;

    var oBanca = new WbmOlimpias.BancaObiect();
    oBanca.Id = $get("hfIdBanca").value;
    oAngajat.oBanca = oBanca;

    oAngajat.StareCivila = $get("tbStareCivila").value;
    oAngajat.NumarTelefon = $get("tbNumarTelefon").value;
    oAngajat.CC = $get("tbCC").value;

    var oDepartament = new WbmOlimpias.DepartamentObiect();
    oDepartament.Id = $get("hfIdDepartament").value;
    oAngajat.oDepartament = oDepartament;

    var oEchipa = new WbmOlimpias.EchipaObiect();
    oEchipa.Id = $get("hfIdEchipa").value;
    oAngajat.oEchipa = oEchipa;

    oAngajat.AdresaEmail = $get("tbAdresaEmail").value;

    var oLinie = new WbmOlimpias.LinieObiect();
    oLinie.Id = $get("hfIdLinie").value;
    oAngajat.oLinie = oLinie;

    oAngajat.DataLichidarii = $get("tbDataLichidarii").value;
    oAngajat.DataMaternitate = $get("tbDataMaternitate").value;

    WbmOlimpias.AngajatiWS.AngajatAdaugare(oAngajat, SucceededCallback, FailedCallback);
}
function Modificare() {
    $get('up').style.display = '';
    var oAngajat = new WbmOlimpias.AngajatObiect();
    oAngajat.Id = $get("hfId").value;

    oAngajat.CodAngajat = $get("tbCodAngajat").value;
    oAngajat.CodSistem = $get("tbCodSistem").value;
    oAngajat.Marca = $get("tbMarca").value;
    oAngajat.Nume = $get("tbNume").value;
    oAngajat.Prenume = $get("tbPrenume").value;
    oAngajat.Strada = $get("tbStrada").value;

    var oLocalitate = new WbmOlimpias.LocalitateObiect();
    oLocalitate.Id = $get("hfIdLocalitate").value;
    oAngajat.oLocalitate = oLocalitate;

    oAngajat.DataNasterii = $get("tbDataNasterii").value;
    oAngajat.Somaj = $get("tbSomaj").value;
    oAngajat.DataAngajarii = $get("tbDataAngajarii").value;
    oAngajat.DataNedeterminat = $get("tbDataNedeterminat").value;

    var oTipPostDeLucru = new WbmOlimpias.TipPostDeLucruObiect();
    oTipPostDeLucru.Id = $get("hfIdTipPostDeLucru").value;
    oAngajat.oTipPostDeLucru = oTipPostDeLucru;

    oAngajat.DataExpirareContract = $get("tbDataExpirareContract").value;
    oAngajat.DataExpirareProba = $get("tbDataExpirareProba").value;

    var oIntervalDeLucru = new WbmOlimpias.IntervalDeLucruObiect();
    oIntervalDeLucru.Id = $get("hfIdIntervalDeLucru").value;
    oAngajat.oIntervalDeLucru = oIntervalDeLucru;

    var oPostDeLucru = new WbmOlimpias.PostDeLucruObiect();
    oPostDeLucru.Id = $get("hfIdPostDeLucru").value;
    oAngajat.oPostDeLucru = oPostDeLucru;

    oAngajat.Sex = $get("tbSex").value;

    var oLoculNasterii = new WbmOlimpias.LocalitateObiect();
    oLoculNasterii.Id = $get("hfIdLoculNasterii").value;
    oAngajat.oLoculNasterii = oLoculNasterii;

    oAngajat.NumarIdentificarePersonala = $get("tbNumarIdentificarePersonala").value;

    var oIncadrare = new WbmOlimpias.IncadrareObiect();
    oIncadrare.Id = $get("hfIdIncadrare").value;
    oAngajat.oIncadrare = oIncadrare;

    var oNivelStudiu = new WbmOlimpias.NivelStudiuObiect();
    oNivelStudiu.Id = $get("hfIdNivelStudiu").value;
    oAngajat.oNivelStudiu = oNivelStudiu;

    var oBanca = new WbmOlimpias.BancaObiect();
    oBanca.Id = $get("hfIdBanca").value;
    oAngajat.oBanca = oBanca;

    oAngajat.StareCivila = $get("tbStareCivila").value;
    oAngajat.NumarTelefon = $get("tbNumarTelefon").value;
    oAngajat.CC = $get("tbCC").value;

    var oDepartament = new WbmOlimpias.DepartamentObiect();
    oDepartament.Id = $get("hfIdDepartament").value;
    oAngajat.oDepartament = oDepartament;

    var oEchipa = new WbmOlimpias.EchipaObiect();
    oEchipa.Id = $get("hfIdEchipa").value;
    oAngajat.oEchipa = oEchipa;

    oAngajat.AdresaEmail = $get("tbAdresaEmail").value;

    var oLinie = new WbmOlimpias.LinieObiect();
    oLinie.Id = $get("hfIdLinie").value;
    oAngajat.oLinie = oLinie;

    oAngajat.DataLichidarii = $get("tbDataLichidarii").value;
    oAngajat.DataMaternitate = $get("tbDataMaternitate").value;

    WbmOlimpias.AngajatiWS.AngajatModificare(oAngajat, SucceededCallback, FailedCallback);
}
function Stergere() {
    if (confirm('Stergem randul selectat?')) {
        $get('up').style.display = '';
        WbmOlimpias.AngajatiWS.AngajatStergere($get("hfId").value, SucceededCallback, FailedCallback);
    }
}
function Localitate() {
    $get('up').style.display = '';
    WbmOlimpias.AngajatiWS.LocalitateCautare($get('tbLocalitate').value, SucceededCallback, FailedCallback);
}
function TipPostDeLucru() {
    $get('up').style.display = '';
    WbmOlimpias.AngajatiWS.TipPostDeLucruCautare($get('tbTipPostDeLucru').value, SucceededCallback, FailedCallback);
}
function IntervalDeLucru() {
    $get('up').style.display = '';
    WbmOlimpias.AngajatiWS.IntervalDeLucruCautare($get('tbIntervalDeLucru').value, SucceededCallback, FailedCallback);
}
function PostDeLucru() {
    $get('up').style.display = '';
    WbmOlimpias.AngajatiWS.PostDeLucruCautare($get('tbPostDeLucru').value, SucceededCallback, FailedCallback);
}
function LoculNasterii() {
    $get('up').style.display = '';
    WbmOlimpias.AngajatiWS.LoculNasteriiCautare($get('tbLoculNasterii').value, SucceededCallback, FailedCallback);
}
function Incadrare() {
    $get('up').style.display = '';
    WbmOlimpias.AngajatiWS.IncadrareCautare($get('tbIncadrare').value, SucceededCallback, FailedCallback);
}
function NivelStudiu() {
    $get('up').style.display = '';
    WbmOlimpias.AngajatiWS.NivelStudiuCautare($get('tbNivelStudiu').value, SucceededCallback, FailedCallback);
}
function Banca() {
    $get('up').style.display = '';
    WbmOlimpias.AngajatiWS.BancaCautare($get('tbBanca').value, SucceededCallback, FailedCallback);
}
function Departament() {
    $get('up').style.display = '';
    WbmOlimpias.AngajatiWS.DepartamentCautare($get('tbDepartament').value, SucceededCallback, FailedCallback);
}
function Echipa() {
    $get('up').style.display = '';
    WbmOlimpias.AngajatiWS.EchipaCautare($get('tbEchipa').value, SucceededCallback, FailedCallback);
}
function Linie() {
    $get('up').style.display = '';
    WbmOlimpias.AngajatiWS.LinieCautare($get('tbLinie').value, SucceededCallback, FailedCallback);
}
function SucceededCallback(result, userContext, methodName) {
    $get('up').style.display = 'none';
    switch (methodName) {
        case ("AngajatiLista"):
            {
                var mytable = $get("tAngajati");
                while (mytable.rows.length > 1) {
                    mytable.deleteRow(1);
                }
                var i = 0;
                for (var item in result.Tabela) {
                    var newrow = mytable.insertRow(-1);
                    newrow.id = i.toString();
                    newrow.onclick = RowClick;
                    newrow.ondblclick = SetariValori;
                    var newcell = newrow.insertCell(-1);
                    newcell.id = 'CodAngajat_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].CodAngajat;
                    newcell.title = result.Tabela[item].CodAngajat;
                    newcell = newrow.insertCell(-1);
                    newcell.id = 'CodSistem_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].CodSistem;
                    newcell.title = result.Tabela[item].CodSistem;
                    newcell = newrow.insertCell(-1);
                    newcell.id = 'Marca_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].Marca;
                    newcell.title = result.Tabela[item].Marca;
                    newcell = newrow.insertCell(-1);
                    newcell.id = 'Nume_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].Nume;
                    newcell.title = result.Tabela[item].Nume;
                    newcell = newrow.insertCell(-1);
                    newcell.id = 'Prenume_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].Prenume;
                    newcell.title = result.Tabela[item].Prenume;
                    newcell = newrow.insertCell(-1);
                    newcell.id = 'Departament_' + i.toString();
                    newcell.className = 'neselectat';
                    newcell.innerHTML = '&nbsp;' + result.Tabela[item].oDepartament.Departament;
                    newcell.title = result.Tabela[item].oDepartament.Departament;
                    newcell = newrow.insertCell(-1);
                    newcell.id = 'Id_' + i.toString();
                    newcell.title = result.Tabela[item].Id;
                    if (i == result.IndexRand)
                        SchimbareRand(i.toString());
                    i++;
                }
                if (i == 0)
                    SchimbareRand('');
                $get("tbPaginaCurenta").value = result.PaginaCurenta;
                $get("tbNumarPagini").value = result.NumarPagini;
                if (i == 1) {
                    $get('tRapoarte').style.display = 'table';
                }
                else {
                    $get('tRapoarte').style.display = 'none';
                }
                break;
            }
        case ("AngajatProprietati"):
            {
                /*** general ***/
                $get("tbCodAngajat").value = result.CodAngajat;
                $get("tbCodSistem").value = result.CodSistem;
                $get("tbMarca").value = result.Marca;
                $get("tbNume").value = result.Nume;
                $get("tbPrenume").value = result.Prenume;
                $get("tbStrada").value = result.Strada;
                $get("hfIdLocalitate").value = result.oLocalitate.Id;
                $get("tbLocalitate").value = result.oLocalitate.Localitate;
                $get("tbDataNasterii").value = result.DataNasterii;
                $get("tbSomaj").value = result.Somaj;
                $get("tbDataAngajarii").value = result.DataAngajarii;
                $get("tbDataNedeterminat").value = result.DataNedeterminat;
                $get("hfIdTipPostDeLucru").value = result.oTipPostDeLucru.Id;
                $get("tbTipPostDeLucru").value = result.oTipPostDeLucru.TipPostDeLucru;
                $get("tbDataExpirareContract").value = result.DataExpirareContract;
                $get("tbDataExpirareProba").value = result.DataExpirareProba;
                $get("hfIdIntervalDeLucru").value = result.oIntervalDeLucru.Id;
                $get("tbIntervalDeLucru").value = result.oIntervalDeLucru.IntervalDeLucru;
                $get("hfIdPostDeLucru").value = result.oPostDeLucru.Id;
                $get("tbPostDeLucru").value = result.oPostDeLucru.PostDeLucru;
                $get("tbSex").value = result.Sex;
                $get("hfIdLoculNasterii").value = result.oLoculNasterii.Id;
                $get("tbLoculNasterii").value = result.oLoculNasterii.Localitate;
                $get("tbNumarIdentificarePersonala").value = result.NumarIdentificarePersonala;
                $get("hfIdIncadrare").value = result.oIncadrare.Id;
                $get("tbIncadrare").value = result.oIncadrare.Incadrare;

                $get("hfIdNivelStudiu").value = result.oNivelStudiu.Id;
                $get("tbNivelStudiu").value = result.oNivelStudiu.NivelStudiu;
                $get("hfIdBanca").value = result.oBanca.Id;
                $get("tbBanca").value = result.oBanca.Banca;

                $get("tbStareCivila").value = result.StareCivila;
                $get("tbNumarTelefon").value = result.NumarTelefon;
                $get("tbCC").value = result.CC;

                $get("hfIdDepartament").value = result.oDepartament.Id;
                $get("tbDepartament").value = result.oDepartament.Departament;
                $get("hfIdEchipa").value = result.oEchipa.Id;
                $get("tbEchipa").value = result.oEchipa.Echipa;

                $get("tbAdresaEmail").value = result.AdresaEmail;
                $get("hfIdLinie").value = result.oLinie.Id;
                $get("tbLinie").value = result.oLinie.Linie;

                $get("tbDataLichidarii").value = result.DataLichidarii;
                $get("tbDataMaternitate").value = result.DataMaternitate;
                break;
            }
        case ("AngajatAdaugare"):
            {
                if (result.Eroare == '')
                    Lista(result.Id);
                else
                    window.alert(result.Eroare);
                break;
            }
        case ("AngajatModificare"):
            {
                if (result.Eroare == '')
                    Lista(result.Id);
                else
                    window.alert(result.Eroare);
                break;
            }
        case ("AngajatStergere"):
            {
                if (result == '')
                    Lista('');
                else
                    window.alert(result);
                break;
            }
        case ('LocalitateCautare'):
            {
                if (result.Id != '') {
                    $get('hfIdLocalitate').value = result.Id;
                    $get('tbLocalitate').value = result.Localitate;
                    $get('tbDataNasterii').focus();
                }
                else
                    bLocalitate_Click();
                break;
            }
        case ('TipPostDeLucruCautare'):
            {
                if (result.Id != '') {
                    $get('hfIdTipPostDeLucru').value = result.Id;
                    $get('tbTipPostDeLucru').value = result.TipPostDeLucru;
                    $get('tbDataExpirareContract').focus();
                }
                else
                    bTipPostDeLucru_Click();
                break;
            }
        case ('IntervalDeLucruCautare'):
            {
                if (result.Id != '') {
                    $get('hfIdIntervalDeLucru').value = result.Id;
                    $get('tbIntervalDeLucru').value = result.IntervalDeLucru;
                    $get('tbPostDeLucru').focus();
                }
                else
                    bIntervalDeLucru_Click();
                break;
            }
        case ('PostDeLucruCautare'):
            {
                if (result.Id != '') {
                    $get('hfIdPostDeLucru').value = result.Id;
                    $get('tbPostDeLucru').value = result.PostDeLucru;
                    $get('tbSex').focus();
                }
                else
                    bPostDeLucru_Click();
                break;
            }
        case ('LoculNasteriiCautare'):
            {
                if (result.Id != '') {
                    $get('hfIdLoculNasterii').value = result.Id;
                    $get('tbLoculNasterii').value = result.Localitate;
                    $get('tbNumarIdentificarePersonala').focus();
                }
                else
                    bLoculNasterii_Click();
                break;
            }
        case ('IncadrareCautare'):
            {
                if (result.Id != '') {
                    $get('hfIdIncadrare').value = result.Id;
                    $get('tbIncadrare').value = result.Incadrare;
                    $get('tbNivelStudiu').focus();
                }
                else
                    bIncadrare_Click();
                break;
            }
        case ('NivelStudiuCautare'):
            {
                if (result.Id != '') {
                    $get('hfIdNivelStudiu').value = result.Id;
                    $get('tbNivelStudiu').value = result.NivelStudiu;
                    $get('tbBanca').focus();
                }
                else
                    bNivelStuidiu_Click();
                break;
            }
        case ('BancaCautare'):
            {
                if (result.Id != '') {
                    $get('hfIdBanca').value = result.Id;
                    $get('tbBanca').value = result.Banca;
                    $get('tbStareCivila').focus();
                }
                else
                    bBanca_Click();
                break;
            }
        case ('DepartamentCautare'):
            {
                if (result.Id != '') {
                    $get('hfIdDepartament').value = result.Id;
                    $get('tbDepartament').value = result.Departament;
                    $get('tbEchipa').focus();
                }
                else
                    bDepartament_Click();
                break;
            }
        case ('EchipaCautare'):
            {
                if (result.Id != '') {
                    $get('hfIdEchipa').value = result.Id;
                    $get('tbEchipa').value = result.Echipa;
                    $get('tbAdresaEmail').focus();
                }
                else
                    bEchipa_Click();
                break;
            }
        case ('LinieCautare'):
            {
                if (result.Id != '') {
                    $get('hfIdLinie').value = result.Id;
                    $get('tbLinie').value = result.Linie;
                    $get('bOk').focus();
                }
                else
                    bLinie_Click();
                break;
            }
        default:
            {
                window.alert('Serviciu inexistent!');
            }
    }
}
function FailedCallback(error, userContext, methodName) 
{
    $get('up').style.display = 'none';
    if(error !== null) 
    {
        window.alert(error.get_message());
    }
}
function RowSelect() {
    $get("CodAngajat_" + $get("hfRowIndex").value).className = 'selectat';
    $get("CodSistem_" + $get("hfRowIndex").value).className = 'selectat';
    $get("Marca_" + $get("hfRowIndex").value).className = 'selectat';
    $get("Nume_" + $get("hfRowIndex").value).className = 'selectat';
    $get("Prenume_" + $get("hfRowIndex").value).className = 'selectat';
    $get("Departament_" + $get("hfRowIndex").value).className = 'selectat';
}
function RowUnselect()
{
    var obiect = $get("CodAngajat_" + $get("hfRowIndex").value);
    if (obiect != null)
        obiect.className = 'neselectat';
    obiect = $get("CodSistem_" + $get("hfRowIndex").value);
    if (obiect != null)
        obiect.className = 'neselectat';
    obiect = $get("Marca_" + $get("hfRowIndex").value);
    if (obiect != null)
        obiect.className = 'neselectat';
    obiect = $get("Nume_" + $get("hfRowIndex").value);
    if(obiect!=null)
        obiect.className = 'neselectat';
    obiect = $get("Prenume_" + $get("hfRowIndex").value);
    if (obiect != null)
        obiect.className = 'neselectat';
    obiect = $get("Departament_" + $get("hfRowIndex").value);
    if (obiect != null)
        obiect.className = 'neselectat';
  
}
function SetariValori() {
    if (window.dialogArguments && dialogArguments.location) {
        var Id = $get('hfId').value;
        var CodAngajat = $get('tbCodAngajat').value;
        var CodSistem = $get('tbCodSistem').value;
        var Marca = $get('tbMarca').value;
        var Nume = $get('tbNume').value;
        var Prenume = $get('tbPrenume').value;
        var IdTipPostDeLucru = $get('hfIdTipPostDeLucru').value;
        var TipPostDeLucru = $get('tbTipPostDeLucru').value;
        var IdPostDeLucru = $get('hfIdPostDeLucru').value;
        var PostDeLucru = $get('tbPostDeLucru').value;
        var IdDepartament = $get('hfIdDepartament').value;
        var Departament = $get('tbDepartament').value;
        var IdEchipa = $get('hfIdEchipa').value;
        var Echipa = $get('tbEchipa').value;
        var IdLinie = $get('hfIdLinie').value;
        var Linie = $get('tbLinie').value;
        var Argumente = new Array(Id, CodAngajat, CodSistem, Marca, Nume, Prenume, IdTipPostDeLucru, TipPostDeLucru, IdPostDeLucru, PostDeLucru, IdDepartament, Departament, IdEchipa, Echipa, IdLinie, Linie);
        window.returnValue = Argumente;
        close();
    }
    else
    {
        $get('tbFiltruCodAngajat').value = $get('tbCodAngajat').value;
        Lista('');
    }
}



function bLocalitate_Click() {
    document.getElementById("showskill").src = "Localitati.aspx";
    document.getElementById("iframe_div").style.display = 'block';

    //var rezultat = window.showModalDialog('Localitati.aspx', window, 'center:yes;resizable:no;dialogHeight:390px;dialogWidth:800px;');


   //if (rezultat != null) {
    $get('hfIdLocalitate').value = $('#showskill').contents().find('#tbFiltruLocalitate').val();
    $get('tbLocalitate').value = $('#showskill').contents().find('#tbLocalitate').val();
        $get('tbDataNasterii').focus();
    //}
}
function bTipPostDeLucru_Click() {
    document.getElementById("showskill").src = "TipuriPostDeLucru.aspx";
    document.getElementById("iframe_div").style.display = 'block';

    var rezultat = window.showModalDialog('TipuriPostDeLucru.aspx', window, 'center:yes;resizable:no;dialogHeight:390px;dialogWidth:800px;');
    if (rezultat != null) {
        $get('hfIdTipPostDeLucru').value = rezultat[0].toString();
        $get('tbTipPostDeLucru').value = rezultat[1].toString();
        $get('tbDataExpirareContract').focus();
    }
}
function bIntervalDeLucru_Click() {
    document.getElementById("showskill").src = "IntervaleDeLucru.aspx";
    document.getElementById("iframe_div").style.display = 'block';

    var rezultat = window.showModalDialog('IntervaleDeLucru.aspx', window, 'center:yes;resizable:no;dialogHeight:590px;dialogWidth:645px;');
    if (rezultat != null) {
        $get('hfIdIntervalDeLucru').value = rezultat[0].toString();
        $get('tbIntervalDeLucru').value = rezultat[1].toString();
        $get('tbPostDeLucru').focus();
   }
}
function bPostDeLucru_Click() {
    document.getElementById("showskill").src = "PosturiDeLucru.aspx";
    document.getElementById("iframe_div").style.display = 'block';

    var rezultat = window.showModalDialog('PosturiDeLucru.aspx', window, 'center:yes;resizable:no;dialogHeight:390px;dialogWidth:800px;');
    if (rezultat != null) {
        $get('hfIdPostDeLucru').value = rezultat[0].toString();
        $get('tbPostDeLucru').value = rezultat[1].toString();
        $get('tbSex').focus();
    }
}
function bLoculNasterii_Click() {
    document.getElementById("showskill").src = "Localitati.aspx";
    document.getElementById("iframe_div").style.display = 'block';

   var rezultat = window.showModalDialog('Localitati.aspx', window, 'center:yes;resizable:no;dialogHeight:300px;dialogWidth:700px;');
    if (rezultat != null) {
        $get('hfIdLoculNasterii').value = rezultat[0].toString();
        $get('tbLoculNasterii').value = rezultat[1].toString();
        $get('tbNumarIdentificarePersonala').focus();
    }
}
function bIncadrare_Click() {
    document.getElementById("showskill").src = "Incadrari.aspx";
    document.getElementById("iframe_div").style.display = 'block';

    var rezultat = window.showModalDialog('Incadrari.aspx', window, 'center:yes;resizable:no;dialogHeight:590px;dialogWidth:645px;');
    if (rezultat != null) {
        $get('hfIdIncadrare').value = rezultat[0].toString();
        $get('tbIncadrare').value = rezultat[1].toString();
        $get('tbNivelStudiu').focus();
    }
}
function bNivelStudiu_Click() {
    document.getElementById("showskill").src = "NiveleStudii.aspx";
    document.getElementById("iframe_div").style.display = 'block';

    var rezultat = window.showModalDialog('NiveleStudii.aspx', window, 'center:yes;resizable:no;dialogHeight:590px;dialogWidth:645px;');
    if (rezultat != null) {
        $get('hfIdNivelStudiu').value = rezultat[0].toString();
        $get('tbNivelStudiu').value = rezultat[1].toString();
        $get('tbBanca').focus();
    }
}
function bBanca_Click() {
    document.getElementById("showskill").src = "Banci.aspx";
    document.getElementById("iframe_div").style.display = 'block';

    var rezultat = window.showModalDialog('Banci.aspx', window, 'center:yes;resizable:no;dialogHeight:590px;dialogWidth:645px;');
    if (rezultat != null) {
        $get('hfIdBanca').value = rezultat[0].toString();
        $get('tbBanca').value = rezultat[1].toString();
        $get('tbStareCivila').focus();
    }
}
function bDepartament_Click() {
    document.getElementById("showskill").src = "Departamente.aspx";
    document.getElementById("iframe_div").style.display = 'block';

    var rezultat = window.showModalDialog('Departamente.aspx', window, 'center:yes;resizable:no;dialogHeight:590px;dialogWidth:645px;');
    if (rezultat != null) {
        $get('hfIdDepartament').value = rezultat[0].toString();
        $get('tbDepartament').value = rezultat[1].toString();
        $get('tbEchipa').focus();
   }
}
function bEchipa_Click() {
    document.getElementById("showskill").src = "Echipe.aspx";
    document.getElementById("iframe_div").style.display = 'block';

    var rezultat = window.showModalDialog('Echipe.aspx', window, 'center:yes;resizable:no;dialogHeight:590px;dialogWidth:645px;');
    if (rezultat != null) {
        $get('hfIdEchipa').value = rezultat[0].toString();
        $get('tbEchipa').value = rezultat[1].toString();
        $get('tbAdresaEmail').focus();
    }
}
function bLinie_Click() {
    document.getElementById("showskill").src = "Linii.aspx";
    document.getElementById("iframe_div").style.display = 'block';

    var rezultat = window.showModalDialog('Linii.aspx', window, 'center:yes;resizable:no;dialogHeight:590px;dialogWidth:645px;');
    if (rezultat != null) {
        $get('hfIdLinie').value = rezultat[0].toString();
        $get('tbLinie').value = rezultat[1].toString();
        $get('bOk').focus();
    }
}
function bFisiereAngajat_Click() {
    document.getElementById("showskill").src = ('FisiereAngajat.aspx?IdAngajat=' + $get('hfId').value);
}
function bEficienteAngajat_Click() {
    document.getElementById("showskill").src = ('EficienteAngajat.aspx?IdAngajat=' + $get('hfId').value);
}
function bFluturaseAngajat_Click() {
    document.getElementById("showskill").src = ('FluturaseAngajat.aspx?IdAngajat=' + $get('hfId').value);
}
function bSalariiAngajat_Click() {
    document.getElementById("showskill").src = ('SalariiAngajat.aspx?IdAngajat=' + $get('hfId').value);
}
function bAbsentaSuplimentar_Click() {
    document.getElementById("showskill").src = ('RaportAbsentaSuplimentar.aspx?IdAngajat=' + $get('hfId').value);
}
function bConcedii_Click() {
    document.getElementById("showskill").src = ('RaportConcedii.aspx?IdAngajat=' + $get('hfId').value);
}
function bDependente_Click() {
    location.href('AngajatiPdf.aspx');
}
function bFisaAngajat_Click() {
    if ($get('hfId').value != '')
        location.href('FisaAngajatPdf.aspx?Id=' + $get('hfId').value);
    else
        window.alert('Alegeti un angajat!');
}
function bStergeFiltru_Click() {
    $get("tbFiltruCodAngajat").value = '';
    $get("tbFiltruCodSistem").value = '';
    $get("tbFiltruMarca").value = '';
    $get("tbFiltruNume").value = '';
    $get("tbFiltruDepartament").value = '';
    $get("tbFiltruEchipa").value = '';
    $get("tbFiltruLinie").value = '';
    Lista($get('hfId').value);
}
function onKeyDown(eventElement) {
    //window.alert(eventElement.keyParolae);
    eventElement = eventElement || window.event;
    var sepropaga = true;
    switch (eventElement.keyCode) {
        case 13:    // enter

            if (eventElement.target.id == 'tbCodAngajat') {
                $get("tbCodSistem").focus();
                sepropaga = false;
            }
            if (eventElement.target.id == 'tbCodSistem') {
                $get("tbMarca").focus();
                sepropaga = false;
            }
            if (eventElement.target.id == 'tbMarca') {
                $get("tbNume").focus();
                sepropaga = false;
            }
            if (eventElement.target.id == 'tbNume') {
                $get("tbPrenume").focus();
                sepropaga = false;
            }
            if (eventElement.target.id == 'tbPrenume') {
                $get("tbStrada").focus();
                sepropaga = false;
            }
            if (eventElement.target.id == 'tbStrada') {
                $get("tbLocalitate").focus();
                sepropaga = false;
            }
            if (eventElement.target.id == 'tbLocalitate')
                Localitate();
            if (eventElement.target.id == 'tbDataNasterii') {
                $get("tbSomaj").focus();
                sepropaga = false;
            }
            if (eventElement.target.id == 'tbSomaj') {
                $get("tbDataAngajarii").focus();
                sepropaga = false;
            }
            if (eventElement.target.id == 'tbDataAngajarii') {
                $get("tbDataNedeterminat").focus();
                sepropaga = false;
            }
            if (eventElement.target.id == 'tbDataNedeterminat') {
                $get("tbTipPostDeLucru").focus();
                sepropaga = false;
            }
            if (eventElement.target.id == 'tbTipPostDeLucru')
                TipPostDeLucru();
            if (eventElement.target.id == 'tbDataExpirareContract') {
                $get("tbDataExpirareProba").focus();
                sepropaga = false;
            }
            if (eventElement.target.id == 'tbDataExpirareProba') {
                $get("tbIntervalDeLucru").focus();
                sepropaga = false;
            }
            if (eventElement.target.id == 'tbIntervalDeLucru')
                IntervalDeLucru();
            if (eventElement.target.id == 'tbPostDeLucru')
                PostDeLucru();
            if (eventElement.target.id == 'tbSex') {
                $get("tbLoculNasterii").focus();
                sepropaga = false;
            }
            if (eventElement.target.id == 'tbLoculNasterii')
                LoculNasterii();
            if (eventElement.target.id == 'tbNumarIdentificarePersonala') {
                $get("tbIncadrare").focus();
                sepropaga = false;
            }
            if (eventElement.target.id == 'tbIncadrare')
                Incadrare();
            if (eventElement.target.id == 'tbNivelStudiu')
                NivelStudiu();
            if (eventElement.target.id == 'tbBanca')
                Banca();
            if (eventElement.target.id == 'tbStareCivila') {
                $get("tbNumarTelefon").focus();
                sepropaga = false;
            }
            if (eventElement.target.id == 'tbNumarTelefon') {
                $get("tbCC").focus();
                sepropaga = false;
            }
            if (eventElement.target.id == 'tbCC') {
                $get("tbDepartament").focus();
                sepropaga = false;
            }
            if (eventElement.target.id == 'tbDepartament')
                Departament();
            if (eventElement.target.id == 'tbEchipa')
                Echipa();
            if (eventElement.target.id == 'tbAdresaEmail') {
                $get("tbLinie").focus();
                sepropaga = false;
            }
            if (eventElement.target.id == 'tbLinie')
                Linie();
            if (eventElement.target.id.length > 8)
                if (eventElement.target.id.substr(0, 8) == 'tbFiltru')
                    Lista('');
            if (eventElement.target.id == 'tbPaginaCurenta')
                Lista('');

            break;
        case 27:    // esc
            bCancel_Click();
            break;
        case 34:    // pg up
            bUrmator_Click();
            break;
        case 33:    // pg down
            bAnterior_Click();
            break;
        case 38:    // sageata sus
                RowPrevious();
            break;
        case 40:    // sageata jos
                RowNext();
            break;
        case 77:    // litera 'm' modificare
            if (eventElement.ctrlKey) {
                sepropaga = false;
                bModificare_Click();
            }
            break;
        case 78:    // litera 'n' adaugare
            if (eventElement.ctrlKey) {
                sepropaga = false;
                bAdaugare_Click();
            }
            break;
        case 76:    // litera 'l'
            if (eventElement.ctrlKey) {
                sepropaga = false;
                $get("tbFiltruCodAngajat").focus();
            }
            break;
        case 68:    // litera 'd' stergere
            if (eventElement.ctrlKey) {
                sepropaga = false;
                bStergere_Click();
            }
            break;
        case 82:    // litera 'r'
            if (eventElement.ctrlKey) {
                sepropaga = false;
                SetariValori();
            }
            break;
        case 85:    // litera 'u'
            if (eventElement.ctrlKey) {
                sepropaga = false;
                $get("tbPaginaCurenta").focus();
            }
            break;
        case 83:    // litera 's' salveaza
            if (eventElement.ctrlKey) {
                sepropaga = false;
                bOk_Click();
            }
            break;
    }
    if (sepropaga) {
        return true;
    }
    else {
        eventElement.cancelBubble = true;
        eventElement.returnValue = false;
        eventElement.keyParolae = 0;
        if (eventElement.stopPropagation) {
            eventElement.stopPropagation();
            eventElement.preventDefault();
        }
        return false;
    }
}
function pageLoad() 
{
    $addHandler(document,"keydown",onKeyDown);
    Lista('');
} 
if (typeof(Sys) !== "undefined") Sys.Application.notifyScriptLoaded();
