<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ContoEconomico.aspx.vb" Inherits="Views_ControloDiGestione_Tables_ContoEconomicoprogress_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Conto Economico </title>
        </head>

<body onload="borderFunction()">
    
      
        <div class="myDiv"> 
    <table>
         <tr>
      <th class="two">Conto Economico S
      </th>
  
        </table>
  </div>
                  <table>
                <th id="progress1">PROGRESSIVO
        </br>
          PRECEDENTE
                </th>
                <th id="mesec">MESE
          </br>
          CORRENTE
                </th>
                <th id="attualex">PROGRESSIVO
          </br>
          ATTUALE
                </th>
                  </table>              
            <table>
                <th id="progress">PROG.
          </br>
          PREC.
                </th>
                <th id="mesec">BGT.PRO.
          </br>
          PREC.
                </th>
                <th id="attuale">PROG.
          </br>
          %
                </th>

                <th id="pro">BDG.PRO.
           </br>
           %
                </th>
                <th id="mese2">MESE
           </br>
           dec.20
                </th>
                <th id="bgt">BGT MESE
          </br>
          dec.20
                </th>
                <th id="procent">MESE
          </br>
          %
                </th>
                <th id="prc">PRC.MES.
         </br>
         %
                </th>
                <th id="prog20">PROG.
          </br>
          dec.20
                </th>
                <th id="bgt20">BGT.PRO.
          </br>
          dec.20
                </th>
                <th id="index">PROG.
          </br>
          %
                </th>
                <th id="indexlast">BGT.PRO.
          </br>
          %
                </th>

        
              <tr id="borders2">
           <td>0</td>
           <td>50</td>
           <td>50</td>
           <td>50</td>
           <td id="gold">50</td>
           <td>50</td>
           <td>50</td>
           <td>50</td>
           <td>50</td>
           <td>50</td>
           <td>50</td>
           <td>50</td>
       </tr>
       
     
       <tr id="borders2">
           <td>1</td>
           <td>50</td>
           <td>50</td>
           <td>50</td>
           <td id="gold">50</td>
           <td>50</td>
           <td>50</td>
           <td>50</td>
           <td>50</td>
           <td>50</td>
           <td>50</td>
           <td>50</td>
       </tr>
                <tr id="borders2">
                    <td>2</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>3</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>4</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>5</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>6</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>7</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>8</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>9</td>
                    <td>94</td>
                    <td>94</td>
                    <td>94</td>
                    <td id="gold">50</td>
                    <td>94</td>
                    <td>94</td>
                    <td>94</td>
                    <td>94</td>
                    <td>94</td>
                    <td>94</td>
                    <td>94</td>
                </tr>
                <tr id="borders2">
                    <td>10</td>
                    <td>67</td>
                    <td>67</td>
                    <td>67</td>
                    <td id="gold">50</td>
                    <td>67</td>
                    <td>67</td>
                    <td>67</td>
                    <td>67</td>
                    <td>67</td>
                    <td>67</td>
                    <td>67</td>
                </tr>
                <tr id="borders2">
                    <td>11</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>12</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>13</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>14</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>15</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>16</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>17</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>18</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>19</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>20</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>21</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>22</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>23</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>24</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>25</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>26</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>27</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>28</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>29</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>30</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>31</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>32</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>33</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>34</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>35</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>36</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>37</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>38</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>39</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>40</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>41</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>42</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>43</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>44</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>45</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>46</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>47</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>48</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>49</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr id="borders2">
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
              <tr id="borders2">
                    <td>51</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">51</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
              <tr id="borders2">
                    <td>52</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
              <tr id="borders2">
                    <td>53</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
              <tr id="borders2">
                    <td>54</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
              <tr id="borders2">
                    <td>55</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
              <tr id="borders2">
                    <td>56</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                  <tr id="borders2">
                    <td>57</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                  <tr id="borders2">
                    <td>58</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                  <tr id="borders2">
                    <td>59</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                  <tr id="borders2">
                    <td>60</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                  <tr id="borders2">
                    <td>61</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                  <tr id="borders2">
                    <td>62</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                  <tr id="borders2">
                    <td>63</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                  <tr id="borders2">
                    <td>64</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                  <tr id="borders2">
                    <td>65</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                  <tr id="borders2">
                    <td>66</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                  <tr id="borders2">
                    <td>67</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                  <tr id="borders2">
                    <td>68</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                  <tr id="borders2">
                    <td>69</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                  <tr id="borders2">
                    <td>70</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                  <tr id="borders2">
                    <td>71</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                      </tr>
                      <tr id="borders2">
                    <td>72</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>

                 <tr id="borders2">
                    <td>73</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                     <tr id="borders2">
                    <td>74</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                     <tr id="borders2">
                    <td>75</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                     <tr id="borders2">
                    <td>76</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                     <tr id="borders2">
                    <td>77</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                     <tr id="borders2">
                    <td>78</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                     <tr id="borders2">
                    <td>79</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                     <tr id="borders2">
                    <td>80</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                     <tr id="borders2">
                    <td>81</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                     <tr id="borders2">
                    <td>82</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                     <tr id="borders2">
                    <td>83</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                     <tr id="borders2">
                    <td>84</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                     <tr id="borders2">
                    <td>85</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                     <tr id="borders2">
                    <td>86</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                     <tr id="borders2">
                    <td>87</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                     <tr id="borders2">
                    <td>88</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                         </tr>
                            <tr id="borders2">
                    <td>89</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td id="gold">50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
               

            </table>
           
    
       
              <style>

                  body{
                      padding-left:150px;
                  }
                
table {
  width: 100%;
  font-size:12px;
    border-collapse: collapse;

}

th, td {
  text-align: center;
  background-color:white;
  border-style:ridge;
    border-width:2px;
   background-color:white;
}

#progress1{
     background-color: #98FB98;
        border: 1px solid;
        font-family:arial;
       font-size:0.8em;
               width:141px;
       text-align:center;

}
#attualex{
       background-color: #98FB98;
        border: 1px solid;
        font-family:arial;
       font-size:0.8em;
               width:150px;
       text-align:center;
}
                  #progress, #attuale,#mesec,#pro,#mese2,#bgt,#procent,#prc,#prog20,#bgt20,#index,#indexlast {
                      background-color: #98FB98;
                      border: 1px solid;
                      font-family: arial;
                      font-size: 0.8em;
                      width: 127px;
                      text-align: center;
                  }
               





#mese2{
    background-color:yellow;
            border: 1px solid;

    width:100px;
           
}

#pro,#bgt,#procent{
    background-color:#98FB98;
             border: 1px solid;
       font-family:arial;
       font-size:0.8em;
       width:100px;
}
                  #prc, #prog20, #bgt20, #index, #indexlast {
                      background-color: #98FB98;
                              border: 1px solid;

                  }
                  
                  tr:nth-child(even) {background-color:#AFEEEE;}



#gold{
    background-color:yellow;
}

.two{
    /*width:107px;*/
    color:red;
    margin-top:0px;
    float:left;
    margin-left:-112px;
}

./*myDiv{
    color:red;
    width:107px;
    margin-top:0px;
    float:left;
}*/



</style>

    <script>
      
        
    </script>

     
</body>
</html>
