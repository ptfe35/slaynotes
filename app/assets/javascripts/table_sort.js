$(function(){
  $('.table_sortable').sortable({
    axis: 'y',
    items: '.item',
    update: function(e, ui){
      let item = ui.item;
      let item_data = item.data();
      let params = {_method: 'put'};
      params[item_data.modelName] = { row_order_position: item.index() }
      $.ajax({
        type: 'POST',
        url: item_data.updateUrl,
        dataType: 'json',
        data: params
      });
    },
    start(e, ui) {
      let cells, tableWidth, widthForEachCell;
      tableWidth = $(this).width();
      cells = ui.item.children('td');
      widthForEachCell = tableWidth / cells.length + 'px';
      return cells.css('width', widthForEachCell);
    },
    stop(e, ui) {
      return ui.item.children('td').effect('highlight');
    },
  });
});