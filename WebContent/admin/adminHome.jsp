
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <script src="https://kit.fontawesome.com/3beab63c5d.js" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
  <link rel="stylesheet" href="../css/style.css" />
<title>welcome</title>
<style>
h1
{
color: white;
text-align: center;
font-size: 100px;
}</style>
</head>
<body>
  <div class="container">
    <div class="row box-1" style="width: 100px;">
      <div class="icon icon-1">
        <a href="index.html">
          <i class="fas fa-home"></i>
          <h5>Dashboard</h5>
        </a>
      </div>
      <div class="icon icon-2">
        <a href="addNewProduct.jsp">
          <i class="fas fa-plus"></i>
          <h5>Add Product</h5>
        </a>
      </div>
      <div class="icon icon-3">
        <a href="viewProducts.jsp">
          <i class="fas fa-eye"></i>
          <h5>View Products</h5>
        </a>
      </div>
      <div class="icon icon-4">
        <a href="cancelOrder.jsp">
          <i class="fas fa-trash-alt"></i>
          <h5>Cancel Order</h5>
        </a>
      </div>
      <div class="icon icon-5">
        <a href="deliveredOrders.jsp">
          <i class="fas fa-shopping-cart"></i>
          <h5>View Orders</h5>
        </a>
      </div>
      <div class="icon icon-6">
        <a href="editProduct.jsp">
          <i class="fas fa-edit"></i>
          <h5>Edit Product</h5>
          </a>
      </div>
      <div class="icon icon-7">
        <i class="fas fa-chart-bar"></i>
        <h5>Reports</h5>
      </div>
      <div class="icon icon-8">
        <i class="fas fa-dice-six"></i>

        <h5>App Tools</h5>
      </div>
      <div class="icon icon-9">
        <i class="far fa-question-circle"></i>
        <h5>Help</h5>
      </div>
    </div>
    <div class="row box-2">
      <!-- first-row -->
      <div class="middle-container">
        <!-- starter -->
        <div class="middle md-1">
          <div class="credit">
            <i class="fas fa-credit-card"></i>
          </div>
          <div class="desc">
            <h3>Starter</h3>
            <h4>subscription plan</h4>
            <div class="messages">
              <h5><span class="fifty">50</span>messages/month</h5>
              <h5>
                <span class="fifty">1</span>keywords.
                <span class="details">view details</span>
              </h5>
            </div>
          </div>
        </div>
        <!-- messages available -->
        <div class="middle md-2">
          <div class="credit">
            <i class="fas fa-comment-dots"></i>
          </div>
          <div class="desc">
            <h3>50</h3>
            <h4>messages available</h4>
            <div class="new-msg-container">
              <div class="new-msg">
                <i class="fas fa-plus-circle"></i>
                <h5>New Msg</h5>
              </div>
              <div class="divider-one"></div>
              <div class="new-msg">
                <i class="fas fa-shopping-cart"></i>
                <h5>Buy More</h5>
              </div>
            </div>
          </div>
        </div>
        <!-- keywords -->
        <div class="middle md-3">
          <div class="credit">
            <i class="fas fa-key"></i>
          </div>
          <div class="desc of">
            <h3><span>0</span>of <span>1</span></h3>
            <h4>keywords</h4>
            <div class="new-msg-container">
              <div class="new-msg">
                <i class="fas fa-plus-circle"></i>
                <h5>Add New</h5>
              </div>
              <div class="divider-one"></div>

              <div class="new-msg">
                <i class="fas fa-shopping-cart"></i>
                <h5>Buy More</h5>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- second-row -->
      <div class="middle-container">
        <!-- subscribers -->
        <div class="middle md-1 lst">
          <i class="fas fa-user one"></i>
          <div class="desc">
            <h3 class="unique1">0</h3>
            <h4 class="unique1">subscribers</h4>
            <h5 class="desc1">0 people subscribed this month</h5>
          </div>
        </div>
        <!-- messages-sent -->
        <div class="middle md-2 lst">
          <i class="fas fa-paper-plane twoo"></i>
          <div class="desc">
            <h3 class="unique2">0</h3>
            <h4 class="unique2">total messages sent</h4>
            <h5 class="desc2">0 messages sent this month</h5>
          </div>
        </div>
        <!-- messages-deliveredd -->
        <div class="middle md-3 lst">
          <i class="fas fa-check three"></i>

          <div class="desc">
            <h3 class="unique3">0</h3>
            <h4 class="unique3">total messages delivered</h4>
            <h5 class="desc3">0 messages delivered this month</h5>
          </div>
        </div>
      </div>

      <!-- actvity report -->
      <div class="activity-page">
        <div class="top-line">
          <div class="report">
            <h5>Activity Report</h5>
          </div>
          <div class="daily">
            <h5>
              Daily <span> <i class="fas fa-caret-down"></i></span>
            </h5>
          </div>
        </div>
        <div class="chart" style="display: flex; justify-content: center">
          <canvas id="calendarChart" style="width: 100%; max-width: 800px"></canvas>
        </div>
      </div>
      <div class="Recently-sent">
        <h5>Recently Sent Campaigns</h5>
      </div>
    </div>

  </div>
  <script>
    let xValues = [
      'Oct 20, 2021',
      'Oct 21, 2021',
      'Oct 22, 2021',
      'Oct 23, 2021',
      'Oct 24, 2021',
      'Oct 25, 2021',
      'Oct 26, 2021',
    ]
    let yValues = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1]
    new Chart('calendarChart', {
      type: 'line',
      data: {
        labels: xValues,
      },
    })
  </script>
</body>
</html>