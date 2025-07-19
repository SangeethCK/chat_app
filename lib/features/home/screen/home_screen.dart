import 'package:chat_app/features/chat/bloc/chat_bloc.dart';
import 'package:chat_app/features/home/bloc/home_bloc.dart';
import 'package:chat_app/shared/constant/decorations.dart';
import 'package:chat_app/shared/routes/routes.dart';
import 'package:chat_app/shared/theme/font_palette.dart';
import 'package:chat_app/shared/widgets/appbar/appbar.dart';
import 'package:chat_app/shared/widgets/empty/empty_state.dart';
import 'package:chat_app/shared/widgets/images/network_image.dart';
import 'package:chat_app/shared/widgets/padding/main_padding.dart';
import 'package:chat_app/shared/widgets/shimmer/shimer_card.dart';
import 'package:chat_app/shared/widgets/text_fields/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppbarWidget(
        title: 'Messages',
        centerTitle: false,
        style: FontPalette.hW700S16,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: MainPadding(
              child: CustomScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(child: SizedBox(height: 14.h)),
                  SliverToBoxAdapter(
                    child: state.userList == null
                        ? buildShimmerOnlineUsers()
                        : _buildOnlineUsersSection(state),
                  ),

                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Divider(color: const Color(0XFFF5F5F5)),
                        6.verticalSpace,
                        _buildSearchField(),
                        14.verticalSpace,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Chat', style: FontPalette.hW600S12),
                        ),
                        8.verticalSpace,
                      ],
                    ),
                  ),

                  state.userList == null
                      ? _buildShimmerChatList()
                      : _buildChatList(state),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildShimmerChatList() {
    return SliverList.separated(
      itemCount: 8,
      separatorBuilder: (context, index) =>
          Divider(color: const Color(0XFFF5F5F5), height: 1, indent: 64.w),
      itemBuilder: (context, index) {
        return buildShimmerChatItem();
      },
    );
  }

  Widget _buildOnlineUsersSection(HomeState state) {
    if (state.userList?.isEmpty ?? true) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: state.userList!.length,
        cacheExtent: 1000,
        itemBuilder: (context, i) {
          final user = state.userList![i];
          return _buildOnlineUserItem(user, i);
        },
      ),
    );
  }

  Widget _buildOnlineUserItem(user, int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300 + (index * 50)),
      curve: Curves.easeOutBack,
      width: 80.w,
      margin: EdgeInsets.only(right: 8.w),
      child: GestureDetector(
        onTap: () => _navigateToChat(user),
        child: Column(
          children: [
            Hero(
              tag: 'avatar_${user.id}',
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: networkImage(user.profilePhotoUrl ?? ''),
                  ),
                ],
              ),
            ),
            4.verticalSpace,
            Text(
              user.name ?? '',
              style: FontPalette.hW600S12.copyWith(
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      decoration: decoration,
      child: TextFeildWidget(
        controller: _searchController,
        inputBorder: inputBorder,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(
            'assets/icons/search-favorite.svg',
            colorFilter: ColorFilter.mode(Colors.grey[600]!, BlendMode.srcIn),
          ),
        ),
        hintText: 'Search',
        onChanged: (value) {
          context.read<HomeBloc>().add(SearchUsersEvent(query: value));
        },
      ),
    );
  }

  Widget _buildChatList(HomeState state) {
    final users = state.displayUserList;
    if (users?.isEmpty ?? true) {
      return SliverFillRemaining(
        child: state.isSearching ? buildNoSearchResults() : buildEmptyState(),
      );
    }
    return SliverList.separated(
      itemCount: users!.length,
      separatorBuilder: (context, index) =>
          Divider(color: const Color(0XFFF5F5F5), height: 1, indent: 64.w),
      itemBuilder: (context, index) {
        final user = users[index];
        return AnimatedContainer(
          duration: Duration(milliseconds: 200 + (index * 30)),
          curve: Curves.easeOutCubic,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => _navigateToChat(user),
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
                child: Row(
                  children: [
                    Hero(
                      tag: 'chat_avatar_${user.id}',
                      child: Stack(
                        children: [networkImage(user.profilePhotoUrl ?? '')],
                      ),
                    ),
                    12.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  user.name ?? '',
                                  style: FontPalette.hW600S14,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                DateFormat('hh a').format(
                                  user.messageReceivedFromPartnerAt ??
                                      DateTime.now(),
                                ),
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _navigateToChat(user) {
    context.read<ChatBloc>().add(
      GetChatEvent(
        userId: int.tryParse(user.id.toString()) ?? 0,
        custId: user.authUserId ?? 0,
      ),
    );

    Navigator.pushNamed(
      context,
      routeChat,
      arguments: {
        "name": user.name ?? '',
        "profileImage": user.profilePhotoUrl ?? '',
        "is_online": user.isOnline ?? false,
        "user_id": user.id,
      },
    );
  }
}
