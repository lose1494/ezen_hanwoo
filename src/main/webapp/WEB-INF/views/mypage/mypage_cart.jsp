<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <link rel="stylesheet" href="/css/mypage/cart.css" />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  
  <div class="wrap">
  <div class="container">
    <h1>장바구니</h1>
    <div class="list">
      <table>
        <tr>
          <th><input type="checkbox" /></th>
          <th></th>
          <th>상품명</th>
          <th>가격</th>
          <th>수량</th>
          <th>추가금액</th>
          <th>총금액</th>
          <th>적립금</th>
          <th>삭제/관심상품</th>
        </tr>
        <tr>
          <td><input type="checkbox" /></td>
          <td><img src="https://via.placeholder.com/80" alt=""></td>
          <td>한우 살치살</td>
          <td>00000원</td>
          <td><input type="number" value="1" min="1" max="10"> <button>변경</button></td>
          <td>0원</td>
          <td>00000원</td>
          <td>0원</td>
          <td class="icon"><img src="./free-icon-cross-mark-8369334.png" alt=""><img src="./heart.png" alt=""></td>
        </tr>
      </table>
    </div>
    <div class="flexDiv">
      <div class="button_area">
        <button>계속 쇼핑하기</button>
        <button>선택상품 주문하기</button>
        <button>선택상품 삭제하기</button>
        <button>장바구니 비우기</button>
        <p class="text">
          <img src="https://www.hanwoodamall.com/_skin/freshsqure_210719/img/common/icon_info.png" /><span>안내사항</span>
          <br>
          <span>- 적립금 사용은 [주문서 작성 / 결제]에서 적용됩니다.</span>
        </p>
      </div>
      <div class="payment_info">
        <table>
          <tr>
            <td>주문금액</td>
            <td>00,000원</td>
          </tr>
          <tr>
            <td>배송료</td>
            <td>0,000원</td>
          </tr>
          <tr>
            <td>결제금액</td>
            <td>00,000원</td>
          </tr>
          <tr>
            <td colspan="2">
              <button>전체상품 주문하기</button>
            </td>
            <td></td>
          </tr>
        </table>
      </div>  
    </div>
  </div>

  <script>
    $('input[type=number]').on('focusin', function() {
      $(this).data('val', $(this).val());
    });
    $('input[type=number]').keydown(function(key) {
      if(key.keyCode == 13) {
        var oldVal = $(this).data('val');
        var newVal = $(this).val();
        if( newVal < 1 || newVal > 10) {         
          $(this).val(oldVal);
        }else {
          $(this).val(newVal);
        }
      }
    })
  </script>
  
 </div>