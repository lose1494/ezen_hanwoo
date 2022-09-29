<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <link rel="stylesheet" href="/css/product/search_result.css">
 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<div class="wrap">
  <div class="container">
    <h1>검색결과</h1>
    <div class="search_condition">
      <input type="text" placeholder="검색어를 입력해 주세요." />
      <button class="search_btn">검색</button>
    </div>
    <div class="list">
      <table>
        <tr>
          <td>카테고리</td>
          <td>ALL(0)</td>
          <td></td>
          <td></td>
        </tr>
      </table>
    </div>
    <div class="search_result">
      <p>상품이 0개 있습니다.</p>
      <select class="sort" name="sort">
        <option value="0" selected>==선택해 주세요==</option>
        <option value="1">별점순</option>
        <option value="2" disabled>할인상품</option>
        <option value="3">높은가격순</option>
        <option value="4">낮은가격순</option>
      </select>
    </div>
    <div class="product">
      <div class="product_item">
        <div class="thumnail"></div>
        <p class="title">상품명</p>
        <p class="sub_title">000원/100g</p>
        <p class="price">00,000원
          <span class="info">( 300g / 1팩 )</span>
        </p>
      </div>
      <div class="product_item">
        <div class="thumnail"></div>
        <p class="title">상품명</p>
        <p class="sub_title">000원/100g</p>
        <p class="price">00,000원
          <span class="info">( 300g / 1팩 )</span>
        </p>
      </div>
      <div class="product_item">
        <div class="thumnail"></div>
        <p class="title">상품명</p>
        <p class="sub_title">000원/100g</p>
        <p class="price">00,000원
          <span class="info">( 300g / 1팩 )</span>
        </p>
      </div>
    </div>
    <div class="pageNav">
         <a href="#">처음</a>
          <a href="#">이전</a>
          <a href="#">1</a>
          <a href="#">2</a>
          <a href="#">3</a>
          <a href="#">다음</a>
          <a href="#">마지막</a>
      </div>
  </div>
</div>

