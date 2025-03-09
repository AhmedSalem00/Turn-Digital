import 'package:booking_application/core/theming/colors.dart';
import 'package:booking_application/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'data/cubit/event_list_cubit.dart';
import 'data/cubit/event_list_state.dart';
import 'data/model/event_list_model.dart';

class EventsListScreen extends StatefulWidget {
  @override
  _EventsListScreenState createState() => _EventsListScreenState();
}

class _EventsListScreenState extends State<EventsListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        context.read<EventsListCubit>().fetchEvents(loadMore: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events", style: TextStyles.font24GrayRegular),
      ),
      body: BlocBuilder<EventsListCubit, EventsListState>(
        builder: (context, state) {
          if (state is EventsLoading &&
              context.read<EventsListCubit>().events.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else if (state is EventsError) {
            return Center(child: Text(state.message));
          } else if (state is EventsLoaded) {
            return ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.all(16),
              itemCount:
                  state.events.length +
                  (context.read<EventsListCubit>().hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < state.events.length) {
                  final event = state.events[index];
                  return EventCard(
                    event: event,
                    onShare: () {
                      Share.share(
                        'Check out this event: ${event.title} - ${event.numberOfGoing} people going',
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final EventListModel event;
  final VoidCallback onShare;

  const EventCard({super.key, required this.event, required this.onShare});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsApp.white,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                event.picture!,
                width: 80.w,
                height: 92.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.read<EventsListCubit>().formatEventDate(
                      event.date ?? '',
                    ),
                    style: TextStyles.font14GrayRegular.copyWith(
                      color: ColorsApp.orange,
                      fontSize: 13.sp,
                    ),
                  ),

                  SizedBox(height: 4.h),
                  Text(event.title!, style: TextStyles.font15GrayRegular),
                  SizedBox(height: 4.h),
                  Row(
                    children: [

                      Icon(Icons.location_on, size: 14, color: Colors.grey),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          event.address!,
                          style: TextStyles.font14BlueRegular.copyWith(
                            fontSize: 13.sp,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.share_outlined),
                        onPressed: onShare,
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.people, size: 14, color: Colors.grey),
                      SizedBox(width: 4.w),
                      Text("${event.numberOfGoing} going"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
